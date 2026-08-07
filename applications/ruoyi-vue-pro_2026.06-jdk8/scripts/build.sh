#!/usr/bin/env bash
set -Eeuo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
image_dir="$project_dir/image"
image_name="yorem/sop-ruoyi-vue-pro:2026.06-jdk8"
archive_name="ruoyi-vue-pro-2026.06-jdk8-linux-amd64.tar"
archive_path="$image_dir/$archive_name"
metadata_path="$image_dir/image.json"
checksum_path="$image_dir/SHA256SUMS"
backend_jar="$project_dir/resources/backend-app.jar"
runtime_jar="$project_dir/resources/backend-app-runtime.jar"
compat_lib_dir="$project_dir/resources/backend-compat-libs"
compat_httpclient="$compat_lib_dir/httpclient-4.5.14.jar"
compat_httpcore="$compat_lib_dir/httpcore-4.4.16.jar"

mkdir -p "$image_dir"
cd "$project_dir"

if [[ ! -s "$project_dir/resources/frontend-dist/index.html" ]]; then
  echo "缺少 resources/frontend-dist/index.html；请先按 manifest 的 frontend_build 生成固定前端产物" >&2
  exit 1
fi
if [[ ! -s "$backend_jar" ]]; then
  echo "缺少 resources/backend-app.jar；请先按 manifest 的 backend_build 生成固定后端产物" >&2
  exit 1
fi
if ! command -v jar >/dev/null 2>&1; then
  echo "构建兼容运行时 jar 需要 JDK 中的 jar 命令" >&2
  exit 1
fi
for compat_file in "$compat_httpclient" "$compat_httpcore"; do
  if [[ ! -s "$compat_file" ]]; then
    echo "缺少固定的 HttpClient 4.x 兼容依赖：$compat_file" >&2
    exit 1
  fi
done
[[ "$(sha256sum "$compat_httpclient" | awk '{print $1}')" == \
  "c8bc7e1c51a6d4ce72f40d2ebbabf1c4b68bfe76e732104b04381b493478e9d6" ]] || {
  echo "httpclient-4.5.14.jar 校验失败" >&2
  exit 1
}
[[ "$(sha256sum "$compat_httpcore" | awk '{print $1}')" == \
  "6c9b3dd142a09dc468e23ad39aad6f75a0f2b85125104469f026e52a474e464f" ]] || {
  echo "httpcore-4.4.16.jar 校验失败" >&2
  exit 1
}
compat_stage="$(mktemp -d)"
trap 'rm -rf "$compat_stage"' EXIT
mkdir -p "$compat_stage/BOOT-INF/lib"
cp "$backend_jar" "$runtime_jar"
cp "$compat_httpclient" "$compat_httpcore" "$compat_stage/BOOT-INF/lib/"
jar uf0 "$runtime_jar" -C "$compat_stage" \
  BOOT-INF/lib/httpclient-4.5.14.jar \
  -C "$compat_stage" \
  BOOT-INF/lib/httpcore-4.4.16.jar
for expected_entry in \
    BOOT-INF/lib/httpclient-4.5.14.jar \
    BOOT-INF/lib/httpcore-4.4.16.jar; do
  jar tf "$runtime_jar" | grep -Fxq "$expected_entry" || {
    echo "运行时 jar 缺少兼容依赖：$expected_entry" >&2
    exit 1
  }
done
if [[ ! -d "$project_dir/source/ruoyi-vue-pro-2026.06-jdk8" || ! -d "$project_dir/source/yudao-ui-admin-vue3-2026.06" ]]; then
  echo "当前轻量仓库不包含源码快照；请按 source/source.yaml 在单独的构建工作目录准备固定源码后再执行构建。" >&2
  exit 2
fi

docker build \
  --platform linux/amd64 \
  --file "$project_dir/docker/Dockerfile" \
  --tag "$image_name" \
  "$project_dir"

docker save --output "$archive_path" "$image_name"
docker image inspect "$image_name" > "$metadata_path"
(
  cd "$project_dir"
  sha256sum "image/$archive_name" "image/image.json"
) > "$checksum_path"

echo "最终 all-in-one 镜像：$image_name"
echo "镜像归档：$archive_path"
