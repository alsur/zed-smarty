{{if $var > 10}}
    Mayor que 10
{{elseif $var > 5}}
    Mayor que 5
{{else}}
    Menor o igual a 5
{{/if}}

{{for $i=0 to $10}}
    {{$i}}
{{/for}}

{{while $condition}}
    ...
{{/while}}
