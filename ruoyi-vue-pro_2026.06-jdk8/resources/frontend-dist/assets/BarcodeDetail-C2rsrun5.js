import{r as e}from"./rolldown-runtime-BM3Ffeng.js";import{Ka as t,Na as n,Wo as r,X as i,ca as a,ga as o,io as s,la as c,ma as l,pa as u,po as d,sa as f,ua as p,ut as m}from"./form-create-JMiOhIvm.js";import{n as h,t as g}from"./css-DiWuhq4d.js";import{Mr as _,in as v,nt as y,pr as b,qn as x}from"./index-DNC7Zg5H.js";import{t as S}from"./Dialog-kIKPGlGv.js";import{c as C}from"./formatTime-B8I2963P.js";import{t as w}from"./DictTag-DtVdbejt.js";import{t as T}from"./download-u9km_W1B.js";import{t as E}from"./Barcode-CltF1SuH.js";import{t as D}from"./barcode-CfNDiVLo.js";var O={class:`flex justify-center items-center min-h-200px p-20px bg-[#f5f7fa] rounded mb-20px`},k={key:0,class:`flex justify-center items-center`},A={class:`inline-block max-w-300px overflow-hidden text-ellipsis whitespace-nowrap break-all`},j=o({name:`BarcodeDetail`,__name:`BarcodeDetail`,setup(e,{expose:o}){let j=v(),M=s(!1),N=s(),P=s({});o({open:e=>{M.value=!0,P.value={...e}},openByBusiness:async(e,t,n,r)=>{M.value=!0;try{let i=await D.getBarcodeByBusiness(t,e);i?P.value={...i}:(P.value={bizType:t,bizId:e,bizCode:n,bizName:r,content:``},j.warning(`未找到对应条码数据`))}catch{P.value={bizType:t,bizId:e,bizCode:n,bizName:r,content:``},j.error(`加载条码数据失败`)}}});let F=()=>{if(!N.value){j.warning(`条码组件未加载`);return}let e=N.value.getImageBase64?.();if(!e){j.warning(`条码生成失败，无法打印`);return}let t=window.open(``,`_blank`);if(!t){j.error(`无法打开打印窗口，请检查浏览器设置`);return}try{let n=`<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>打印条码</title>
    <style>
      * { margin: 0; padding: 0; }
      body { font-family: Arial, sans-serif; padding: 20px; }
      .print-container { text-align: center; }
      .barcode-img { max-width: 100%; margin: 20px 0; }
      .info { margin-top: 20px; text-align: left; font-size: 12px; }
      .info p { margin: 5px 0; }
      @media print {
        body { padding: 0; }
        .print-container { padding: 20px; }
      }
    </style>
  </head>
  <body>
    <div class="print-container">
      <img src="${e}" class="barcode-img" alt="条码" />
      <div class="info">
        <p><strong>业务编码:</strong> ${x(P.value.bizCode||``)}</p>
        <p><strong>业务名称:</strong> ${x(P.value.bizName||``)}</p>
        <p><strong>条码内容:</strong> ${x(P.value.content||``)}</p>
      </div>
    </div>
  </body>
</html>`;t.document.write(n),t.document.close(),t.onload=()=>{setTimeout(()=>{t.print()},500)}}catch{j.error(`打印失败，请重试`)}},I=()=>{if(!N.value){j.warning(`条码组件未加载`);return}let e=N.value.getImageBase64?.();if(!e){j.warning(`条码生成失败，无法下载`);return}try{T.base64Image(e,`barcode_${P.value.bizCode||`unknown`}_${Date.now()}`),j.success(`下载成功`)}catch{j.error(`下载失败，请重试`)}},L=async()=>{let{bizType:e,bizId:t,bizCode:n,bizName:r}=P.value;if(!e||!t){j.warning(`缺少业务类型或业务编号，无法生成条码`);return}try{await D.createBarcode({bizType:e,bizId:t,bizCode:n||``,bizName:r||``}),j.success(`条码生成成功`);let i=await D.getBarcodeByBusiness(e,t);i&&(P.value={...i})}catch(e){j.error(e?.message||`条码生成失败，请重试`)}};return(e,o)=>{let s=_,v=w,x=h,T=m,D=g,j=b,R=i,z=S;return n(),a(z,{title:`查看条码`,modelValue:M.value,"onUpdate:modelValue":o[1]||=e=>M.value=e,width:`500px`},{footer:t(()=>[P.value.content?c(``,!0):(n(),a(R,{key:0,type:`warning`,onClick:L},{default:t(()=>[l(j,{icon:`ep:magic-stick`,class:`mr-5px`}),o[2]||=u(` 生成 `,-1)]),_:1})),l(R,{type:`primary`,onClick:F},{default:t(()=>[l(j,{icon:`ep:printer`,class:`mr-5px`}),o[3]||=u(` 打印 `,-1)]),_:1}),l(R,{onClick:I},{default:t(()=>[l(j,{icon:`ep:download`,class:`mr-5px`}),o[4]||=u(` 下载 `,-1)]),_:1}),l(R,{onClick:o[0]||=e=>M.value=!1},{default:t(()=>[...o[5]||=[u(`关 闭`,-1)]]),_:1})]),default:t(()=>[f(`div`,null,[f(`div`,O,[P.value.content?(n(),p(`div`,k,[l(E,{ref_key:`barcodeRef`,ref:N,content:P.value.content,format:P.value.format,width:400,height:150},null,8,[`content`,`format`])])):(n(),a(s,{key:1,description:`暂无条码数据`}))]),l(D,{column:1,border:``},{default:t(()=>[l(x,{label:`条码格式`,"label-align":`left`,align:`left`},{default:t(()=>[P.value.format?(n(),a(v,{key:0,type:d(y).MES_WM_BARCODE_FORMAT,value:P.value.format},null,8,[`type`,`value`])):c(``,!0)]),_:1}),l(x,{label:`业务类型`,"label-align":`left`,align:`left`},{default:t(()=>[P.value.bizType?(n(),a(v,{key:0,type:d(y).MES_WM_BARCODE_BIZ_TYPE,value:P.value.bizType},null,8,[`type`,`value`])):c(``,!0)]),_:1}),l(x,{label:`条码内容`,"label-align":`left`,align:`left`},{default:t(()=>[l(T,{content:P.value.content,placement:`top`},{default:t(()=>[f(`span`,A,r(P.value.content),1)]),_:1},8,[`content`])]),_:1}),l(x,{label:`业务编码`,"label-align":`left`,align:`left`},{default:t(()=>[u(r(P.value.bizCode||`-`),1)]),_:1}),l(x,{label:`业务名称`,"label-align":`left`,align:`left`},{default:t(()=>[u(r(P.value.bizName||`-`),1)]),_:1}),l(x,{label:`状态`,"label-align":`left`,align:`left`},{default:t(()=>[P.value.status===void 0?c(``,!0):(n(),a(v,{key:0,type:d(y).COMMON_STATUS,value:P.value.status},null,8,[`type`,`value`]))]),_:1}),l(x,{label:`创建时间`,"label-align":`left`,align:`left`},{default:t(()=>[u(r(d(C)(P.value.createTime)),1)]),_:1})]),_:1})])]),_:1},8,[`modelValue`])}}}),M=e({default:()=>N}),N=j;export{M as n,N as t};