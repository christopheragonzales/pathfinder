select core.monster_id
     , core.monster_name
     , core.cr                                     as challenge_rating
     , core.xp                                     as experience_points
     , core.race
     , core.class                                  as monster_class
     , core.level
     , upper(core.alignment)                       as alignment
     , core.size
     , core.type
     , monster_stats.str                           as strength
     , monster_stats.dex                           as dexterity
     , monster_stats.con                           as constitution
     , monster_stats.int                           as intelligence
     , monster_stats.wis                           as wisdom
     , monster_stats.cha                           as charisma
     , {{ ability_modifier('monster_stats.str') }} as str_modifier
     , {{ ability_modifier('monster_stats.dex') }} as dex_modifier
     , {{ ability_modifier('monster_stats.con') }} as con_modifier
     , {{ ability_modifier('monster_stats.int') }} as int_modifier
     , {{ ability_modifier('monster_stats.wis') }} as wis_modifier
     , {{ ability_modifier('monster_stats.cha') }} as cha_modifier
  from {{ ref("monster_core") }}                   as core
  join {{ ref("monster_stats") }}                  as monster_stats
    on core.monster_id = monster_stats.monster_id