with
    base as (
        select
            header.monster_id,
            initcap(header.monster_name) as monster_name,
            header.challenge_rating,
            header.experience_points,
            initcap(header.race) as race,
            initcap(header.monster_class) as monster_class,
            header.level,
            upper(header.alignment) as alignment,
            case
                when header.improved_initiative = true then 4 else 0
            end as improved_initiative_mod,
            {{ ability_modifier("header.dex") }} as dexterity_modifier,
            header.darkvision,
            header.perception_modifier
        from {{ ref("stg_monster_header") }} as header
    )

select
    base.monster_id,
    base.monster_name,
    base.challenge_rating,
    base.experience_points,
    base.race,
    base.level,
    base.alignment,
    (
        base.improved_initiative_mod 
        + base.dexterity_modifier
    ) as initiative_modifier,
    base.darkvision,
    base.perception_modifier
from base
