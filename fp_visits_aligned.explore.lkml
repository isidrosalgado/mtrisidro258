include: "/commerce_first_party/data_portal/extended_views/fp_visits_aligned.view.lkml"
include: "/enhanced_tables/extended_views/fpet_dm_agg_lvl_site_itemid.view.lkml"

explore: fp_visits_aligned {
  hidden: yes
  description: "Este explore no queda a la vista de los usuarios"



  join: fpet_dm_agg_lvl_site_itemid {
    from: fpet_dm_agg_lvl_site_itemid
    type: left_outer
    relationship: one_to_one
    sql_on:
          ${fp_visits_aligned.sit_site_id} = ${fpet_dm_agg_lvl_site_itemid.sit_site_id}
      AND ${fp_visits_aligned.ite_item_id} = ${fpet_dm_agg_lvl_site_itemid.ite_item_id}
      ;;
  }
  always_filter: {
    filters: [fp_visits_aligned.sit_site_id: "MLA,MLB,MLC,MLM,MCO"]
    }

}
