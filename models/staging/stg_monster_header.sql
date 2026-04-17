
select
    core.monster_id,
    core.monster_name,
    core.cr as challenge_rating,
    core.xp as experience_points,
    core.race,
    core.class as monster_class,
    core.level,
    core.alignment,
    feats.improved_initiative,
    mon_stats.dex,
    senses.darkvision,
    senses.perception_mod as perception_modifier
from {{ ref("monster_core") }} as core
join {{ ref("monster_feats") }} as feats using (monster_id)
join {{ ref("monster_stats") }} as mon_stats using (monster_id)
join {{ ref("monster_senses") }} as senses using (monster_id)
