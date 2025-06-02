include: "/commerce_first_party/data_portal/extended_views/fp_share_aligned.view.lkml"
#include: "/enhanced_tables/extended_views/alternative_hierarchies.view.lkml"
#include: "/enhanced_tables/extended_views/planes_alternative_hierarchies.view.lkml"

explore: fp_share_aligned {
  hidden: yes
  description: " Este explore no queda a la vista de los usuarios"
  from: fp_share_aligned
  fields: [
    fp_share_aligned.ord_closed_dt_date,
    fp_share_aligned.ord_closed_dt_week,
    fp_share_aligned.ord_closed_dt_month,
    fp_share_aligned.ord_closed_dt_quarter,
    fp_share_aligned.sit_site_id,
    fp_share_aligned.vertical_domain,
    fp_share_aligned.dom_domain_agg1,
    fp_share_aligned.dom_domain_agg2,

    fp_share_aligned.tgmv_forshare,
    fp_share_aligned.tgmv_forshare_lc,
    fp_share_aligned.tgmv_forshare_cc,
    fp_share_aligned.gmv_forshare,
    fp_share_aligned.gmv_forshare_lc,
    fp_share_aligned.tsi_forshare,
    fp_share_aligned.si_forshare,
    fp_share_aligned.visits_all,

    fp_share_aligned.ite_item_sap_sku_null,
    fp_share_aligned.ite_item_id_null,
    fp_share_aligned.ite_item_dom_domain_id_null,
    fp_share_aligned.ite_item_bulky_flg_plus_mlm_mla_null,
    fp_share_aligned.ite_item_supermarket_flg_null,
    fp_share_aligned.ite_item_title_null,
    fp_share_aligned.ite_item_brand_null,
    fp_share_aligned.ite_item_status_null,
    fp_share_aligned.sap_vendor_estimated_null,
    fp_share_aligned.cohort_sap_vendor_null,

    fp_share_aligned.vertical_domain_alt_null,
    fp_share_aligned.dom_domain_agg1_alt_null,
    fp_share_aligned.dom_domain_agg2_alt_null,
    fp_share_aligned.ite_item_dom_domain_id_alt_null,
    fp_share_aligned.version,

    fp_share_aligned.campo_validador,

    fp_share_aligned.ite_item_mc_hb_null,
    fp_share_aligned.clasif_mc_null,
    fp_share_aligned.buybox_flg_null

  ]

#  join: alt_hierarchies {
#    from: planes_alternative_hierarchies
#    view_label: "DOMAINS"
#    type: inner
#    relationship: one_to_one
#    sql_on:
#          ${fp_share_aligned.dom_domain_agg2} = ${alt_hierarchies.dom_domain_agg2}
#      AND ${fp_share_aligned.dom_domain_agg1} = ${alt_hierarchies.dom_domain_agg1}
#      AND ${fp_share_aligned.vertical_domain} = ${alt_hierarchies.vertical_domain}
#      AND ${fp_share_aligned.sit_site_id}  = ${alt_hierarchies.sit_site_id}
#      ;;
#  }

#  join: alternative_hierarchies {
#    from: alternative_hierarchies
#    view_label: "DOMAINS"
#    type: left_outer
#    relationship: one_to_one
#    sql_on:  ${fp_share_aligned.dom_domain_agg2}   = ${alternative_hierarchies.dom_domain_agg2}
#         AND ${fp_share_aligned.dom_domain_agg1}   = ${alternative_hierarchies.dom_domain_agg1}
#         AND ${fp_share_aligned.vertical_domain}   = ${alternative_hierarchies.vertical_domain}
#         AND ${fp_share_aligned.sit_site_id}       = ${alternative_hierarchies.sit_site_id}
#
#      ;;
#  }

  always_filter: {
    filters: [fp_share_aligned.sit_site_id: "MLA,MLB,MLC,MLM,MCO,no 1p"]
  }


   # alternative_hierarchies.vertical_domain_alt,
   # alternative_hierarchies.dom_domain_agg1_alt,
   # alternative_hierarchies.dom_domain_agg2_alt,
   # alternative_hierarchies.ite_item_dom_domain_id_alt_null,
}
