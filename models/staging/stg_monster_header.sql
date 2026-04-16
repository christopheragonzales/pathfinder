with
    base_header as (
        select
            core.monster_id,
            initcap(core.monster_name) as monster_name,
            core.cr as challenge_rating,
            core.xp as experience_points,
            initcap(core.race) as race,
            core.class as monster_class,
            core.level,
            upper(core.alignment) as alignment,
            case
                when feats.improved_initiative = true then 4 else 0
            end as improved_initiative_bonus,
            {{ ability_modifier("mon_stats.dex") }} as dex_mod,
            senses.darkvision,
            senses.perception_mod as perception_modifier
        from {{ ref("monster_core") }} as core
        join {{ ref("monster_feats") }} as feats using (monster_id)
        join {{ ref("monster_stats") }} as mon_stats using (monster_id)
        join {{ ref("monster_senses") }} as senses using (monster_id)
    )

select
    base_header.monster_id,
    base_header.monster_name,
    base_header.challenge_rating,
    base_header.experience_points,
    base_header.race,
    base_header.level,
    base_header.alignment,
    (base_header.improved_initiative_bonus + base_header.dex_mod) as initiative_modifier,
    base_header.darkvision,
    base_header.perception_modifier
from base_header
