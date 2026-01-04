{* Smarty con delimitadores simples *}
{include file="header.tpl"}

<h1>{$title|upper}</h1>

{if $user.logged}
    <p>Bienvenido, {$user.name}!</p>
{else}
    <p>Por favor inicia sesión</p>
{/if}

<ul>
{foreach from=$items item=item}
    <li>{$item.name|truncate:30:"..."}</li>
{foreachelse}
    <li>No hay items</li>
{/foreach}
</ul>

{literal}
<script type="text/javascript">
var obj = {name: "value"};
</script>
{/literal}
