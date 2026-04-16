{% macro ability_modifier(score) %}
    floor((cast({{ score }} as int) - 10) / 2)
{% endmacro %}
