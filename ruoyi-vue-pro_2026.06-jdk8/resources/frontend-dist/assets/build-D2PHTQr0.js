import"./rolldown-runtime-BM3Ffeng.js";import{$a as e,Aa as t,Ka as n,La as r,Na as i,Ra as a,Wo as o,X as s,ga as c,io as l,it as u,la as d,ma as f,n as p,pa as m,po as h,qa as g,sa as _,ta as v,ua as y}from"./form-create-JMiOhIvm.js";import{d as b}from"./is-psFHWo-T.js";import{f as x,in as S,pn as C,yt as w}from"./index-DNC7Zg5H.js";import{t as T}from"./Dialog-kIKPGlGv.js";import{t as E}from"./ContentWrap-B0-pmp4y.js";import{t as D}from"./es-0chdbvn8.js";/* empty css               */import{t as O}from"./java-DcHuTPVI.js";import{t as k}from"./json-B14wryys.js";var A={class:`h-[calc(100vh-var(--top-tool-height)-var(--tags-view-height)-var(--app-content-padding)-var(--app-content-padding)-2px)]`},j={key:0,ref:`editor`},M={class:`hljs`},N=c({name:`InfraBuild`,__name:`index`,setup(c){let{t:N}=C(),P=S(),F=l({switchType:[],autoActive:!0,useTemplate:!1,formOptions:{form:{labelWidth:`100px`}},fieldReadonly:!1,hiddenDragMenu:!1,hiddenDragBtn:!1,hiddenMenu:[],hiddenItem:[],hiddenItemConfig:{},disabledItemConfig:{},showSaveBtn:!1,showConfig:!0,showBaseForm:!0,showControl:!0,showPropsForm:!0,showEventForm:!0,showValidateForm:!0,showFormConfig:!0,showInputData:!0,showDevice:!0,appendConfigData:[]}),I=l(),L=l(!1),R=l(``),z=l(-1),B=l(``);w(I);let V=e=>{L.value=!0,R.value=e},H=()=>{V(`生成 JSON`),z.value=0,B.value=I.value.getRule()},U=()=>{V(`生成 Options`),z.value=1,B.value=I.value.getOption()},W=()=>{V(`生成组件`),z.value=2,B.value=G()},G=()=>{let e=I.value.getRule(),t=I.value.getOption();return`<template>
    <form-create
      v-model:api="fApi"
      :rule="rule"
      :option="option"
      @submit="onSubmit"
    ></form-create>
  </template>
  <script setup lang=ts>
    const faps = ref(null)
    const rule = ref('')
    const option = ref('')
    const init = () => {
      rule.value = formCreate.parseJson('${p.toJson(e).replaceAll(`\\`,`\\\\`)}')
      option.value = formCreate.parseJson('${JSON.stringify(t)}')
    }
    const onSubmit = (formData) => {
      //todo 提交表单
    }
    init()
  <\/script>`},K=async e=>{let{copy:t,copied:n,isSupported:r}=x({legacy:!0,source:JSON.stringify(e,null,2)});r?(await t(),h(n)&&P.success(N(`common.copySuccess`))):P.error(N(`common.copyError`))},q=e=>{let t=`json`;return z.value===2&&(t=`xml`),b(e)||(e=JSON.stringify(e,null,2)),D.highlight(e,{language:t,ignoreIllegals:!0}).value||`&nbsp;`};return t(async()=>{D.registerLanguage(`xml`,O),D.registerLanguage(`json`,k)}),(t,c)=>{let l=s,p=r(`fc-designer`),b=E,x=u,S=T,C=a(`dompurify-html`);return i(),y(v,null,[f(b,{"body-style":{padding:`0px`},class:`!mb-0`},{default:n(()=>[_(`div`,A,[f(p,{class:`my-designer`,ref_key:`designer`,ref:I,config:h(F)},{handle:n(()=>[f(l,{size:`small`,type:`primary`,plain:``,onClick:H},{default:n(()=>[...c[2]||=[m(`生成JSON`,-1)]]),_:1}),f(l,{size:`small`,type:`success`,plain:``,onClick:U},{default:n(()=>[...c[3]||=[m(`生成Options`,-1)]]),_:1}),f(l,{size:`small`,type:`danger`,plain:``,onClick:W},{default:n(()=>[...c[4]||=[m(`生成组件`,-1)]]),_:1})]),_:1},8,[`config`])])]),_:1}),f(S,{modelValue:h(L),"onUpdate:modelValue":c[1]||=t=>e(L)?L.value=t:null,title:h(R),"max-height":`600`},{default:n(()=>[h(L)?(i(),y(`div`,j,[f(l,{style:{float:`right`},onClick:c[0]||=e=>K(h(B))},{default:n(()=>[m(o(h(N)(`common.copy`)),1)]),_:1}),f(x,{height:`580`},{default:n(()=>[_(`div`,null,[_(`pre`,null,[g(_(`code`,M,null,512),[[C,q(h(B))]])])])]),_:1})],512)):d(``,!0)]),_:1},8,[`modelValue`,`title`])],64)}}});export{N as default};