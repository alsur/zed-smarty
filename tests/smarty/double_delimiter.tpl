{* Smarty con delimitadores dobles {{}} *}
{{include file="header.tpl"}}

<h1>{{$title|upper}}</h1>

{{if $is_valid_cookie}}
    <p>Cookie válida: {{$cookie_name}}</p>
{{else}}
    <p>Cookie inválida</p>
{{/if}}

{{foreach from=$items item=item}}
    <li>{{$item.name}}</li>
{{foreachelse}}
    <li>No hay items</li>
{{/foreach}}

{{literal}}
<script>
var obj = {name: "value"}; {* JavaScript usa llaves simples *}
</script>
{{/literal}}
