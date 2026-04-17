select
    mon_armor.monster_id,
    mon_armor.armor_id,
    armor.armor_name,
    armor.armor_bonus,
    armor.max_dex_bonus,
    armor.armor_check_penalty,
    armor.arcane_spell_fail_chance,
    armor.speed_30,
    armor.speed_20,
    armor.weight
from {{ ref("monster_to_armor") }} as mon_armor
join {{ ref("armor_bonuses") }} as armor
