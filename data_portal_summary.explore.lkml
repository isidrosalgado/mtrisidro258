include: "/commerce_first_party/data_portal/extended_views/metrics_1p_sku_dos.view.lkml"
include: "/utilities/ctc_metrics_1p_sku_dos.lkml"
include: "/utilities/fp_parameters.view.lkml"


explore: data_portal_summary {
  from: metrics_1p_sku_dos

  group_label: "Commerce First Party"
  label: "Data Portal Summary"
  description: "Data Portal es una herramienta de análisis de datos de 1P que proporciona escalabilidad y dinamismo. Con ella, podemos reducir el trabajo manual y el esfuerzo de los equipos, a la vez que ofrecemos una fuente confiable que consolida variados datos de 1P en un solo lugar. Al hacerlo, se promueve la autonomía para construir y automatizar informes de forma self-service."

  fields: [

    data_portal_summary.date_day_raw,
    data_portal_summary.date_day_date,
    data_portal_summary.date_day_week,
    data_portal_summary.date_day_month,
    data_portal_summary.date_day_quarter,
    data_portal_summary.date_day_year,
    data_portal_summary.period_type,

    data_portal_summary.sit_site_id,

    data_portal_summary.vertical_domain,
    data_portal_summary.dom_domain_agg1,
    data_portal_summary.dom_domain_agg2,
    data_portal_summary.ite_item_dom_domain_id,

    data_portal_summary.ite_item_sap_sku,
    data_portal_summary.ite_item_id,

    data_portal_summary.ite_item_supermarket_flg,
    data_portal_summary.ite_item_bulky_flg_plus_mlm_mla,
    data_portal_summary.ite_item_mc_hb,
    data_portal_summary.clasif_mc,

    data_portal_summary.ite_item_title,
    data_portal_summary.ite_item_brand,
    data_portal_summary.ite_item_color,
    data_portal_summary.ite_item_status,
    data_portal_summary.sap_vendor_estimated,
    data_portal_summary.cohort_sku,
    data_portal_summary.cohort_sap_vendor,
    data_portal_summary.pk_owner,

    data_portal_summary.vertical_domain_alt,
    data_portal_summary.dom_domain_agg1_alt,
    data_portal_summary.dom_domain_agg2_alt,
    data_portal_summary.ite_item_dom_domain_id_alt,

    data_portal_summary.select_period_metrics_1p,

    data_portal_summary.tgmv_1p,
    data_portal_summary.tgmv_1p_lc,
    data_portal_summary.tgmv_1p_cc,

    data_portal_summary.gmv_1p,
    data_portal_summary.gmv_1p_lc,
    data_portal_summary.tsi_1p,
    data_portal_summary.si_1p,
    data_portal_summary.visits_1p,
    data_portal_summary.stock_saleable_valued_estimated,
    data_portal_summary.stock_saleable_valued_estimated_lc,
    data_portal_summary.stock_saleable,

    data_portal_summary.doh,
    data_portal_summary.doi,
    data_portal_summary.deadwood_p,

    ue_ppm_consolidate,
    ue_ppm_consolidate_lc,

  ]
}
