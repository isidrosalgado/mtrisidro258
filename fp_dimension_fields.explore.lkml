
  include: "/commerce_first_party/data_portal/extended_views/fp_dimension_fields.view.lkml"
  include: "/enhanced_tables/extended_views/item_sapsku_color.view.lkml"

  include: "/enhanced_tables/extended_views/vendor_owner_fp.view.lkml"
  include: "/sources/meli_bi_data/whowner/lk_1p_vertical_owner.view.lkml"

  include: "/enhanced_tables/extended_views/melipro_flg.view.lkml"
  include: "/enhanced_tables/extended_views/agregaciones_sku.view.lkml"



    #include: "/enhanced_tables/extended_views/fpet_cohorts_im_sku.view.lkml"


  explore: fp_dimension_fields {
    from: fp_dimension_fields
    hidden: yes
    label: "DM Dates & Dimensions"
    description: "Este explore no queda a la vista de los usuarios - Maestro fechas y dimensiones"

    fields: [

      fp_dimension_fields.ord_closed_dt_date,
      fp_dimension_fields.ord_closed_dt_week,
      fp_dimension_fields.ord_closed_dt_month,
      fp_dimension_fields.ord_closed_dt_quarter,

      fp_dimension_fields.increment_key_dt_date,
      fp_dimension_fields.increment_key_dt_week,
      fp_dimension_fields.increment_key_dt_month,
      fp_dimension_fields.increment_key_dt_quarter,

      fp_dimension_fields.sit_site_id,
      fp_dimension_fields.ite_item_id,
      fp_dimension_fields.ite_item_id_join,
      fp_dimension_fields.campo_validador,
      fp_dimension_fields.ite_item_sap_sku,

      fp_dimension_fields.vertical_domain,
      fp_dimension_fields.dom_domain_agg1,
      fp_dimension_fields.dom_domain_agg2,
      fp_dimension_fields.ite_item_dom_domain_id,

      fp_dimension_fields.vertical_domain_alt,
      fp_dimension_fields.dom_domain_agg1_alt,
      fp_dimension_fields.dom_domain_agg2_alt,
      fp_dimension_fields.ite_item_dom_domain_id_alt,

      fp_dimension_fields.ite_item_bulky_flg_plus_mlm_mla,
      fp_dimension_fields.ite_item_mc_hb,
      fp_dimension_fields.clasif_mc,

      fp_dimension_fields.ite_item_supermarket_flg,

      fp_dimension_fields.ite_item_title,
      fp_dimension_fields.ite_item_status,
      fp_dimension_fields.ite_item_brand,

      fp_dimension_fields.cohort_sap_vendor,
      fp_dimension_fields.sap_vendor_estimated,
      fp_dimension_fields.plan_version,

      fp_dimension_fields.buybox_flg,
      fp_dimension_fields.sap_vendor_estimated,

      item_sapsku_color.ite_item_color,

      vendor_owner_fp.pk_owner,
      lk_1p_vertical_owner.vertical_owner,
      brand_owner_fp.brand_owner,

      melipro_flg.meli_pro_flg,

      agregaciones_sku.sap_vendor,
      agregaciones_sku.ean_estimated,
      agregaciones_sku.cohort_sku,
      agregaciones_sku.sku_meli_pro_flg,

    ]
    #fpet_cohorts_im_sku.cohort_sku,
    #refactoring_fp_lk_jerarquias_comerciales.bu_name,

  #  join: fpet_cohorts_im_sku {
  #    from: fpet_cohorts_im_sku
  #    view_label: "SKU COHORT"
  #    type: left_outer
  #    relationship: one_to_one
  #    sql_on:    ${fp_dimension_fields.ite_item_sap_sku}   = ${fpet_cohorts_im_sku.ite_item_sap_sku}
  #      AND      ${fp_dimension_fields.sit_site_id}        = ${fpet_cohorts_im_sku.sit_site_id}
  #                        ;;
  #  }

  #  join: refactoring_fp_lk_jerarquias_comerciales {
  #    from: refactoring_fp_lk_jerarquias_comerciales
  #    type: left_outer
  #    relationship: one_to_one
  #    sql_on:     ${fp_dimension_fields.sit_site_id}             = ${refactoring_fp_lk_jerarquias_comerciales.sit_site_id}
  #            AND ${fp_dimension_fields.ite_item_dom_domain_id}  = ${refactoring_fp_lk_jerarquias_comerciales.dom_domain_id}
  #      ;;
  #  }

    join: agregaciones_sku {
      from: agregaciones_sku
      type: left_outer
      relationship: one_to_one
      sql_on:     ${fp_dimension_fields.sit_site_id}             = ${agregaciones_sku.sit_site_id}
              AND ${fp_dimension_fields.ite_item_sap_sku}        = ${agregaciones_sku.ite_item_sap_sku}

        ;;
    }

    join: melipro_flg {
      from: melipro_flg
      type: left_outer
      relationship: one_to_one
      sql_on:     ${fp_dimension_fields.sit_site_id}           = ${melipro_flg.sit_site_id}
              AND ${fp_dimension_fields.sap_vendor_estimated}  = ${melipro_flg.vendor_plan}
        ;;
    }

    join: item_sapsku_color {
      from: item_sapsku_color
      view_label: "SKU COLOR"
      type: left_outer
      relationship: one_to_one
      sql_on:    ${fp_dimension_fields.ite_item_sap_sku}   = ${item_sapsku_color.ite_item_sap_sku}
        AND      ${fp_dimension_fields.sit_site_id}        = ${item_sapsku_color.sit_site_id}
                          ;;
    }


    join: vendor_owner_fp {
      from: vendor_owner_fp
      type: left_outer
      relationship: one_to_one
      sql_on:     ${fp_dimension_fields.sit_site_id}                     = ${vendor_owner_fp.sit_site_id}
              AND ${fp_dimension_fields.dom_domain_agg2}                 = ${vendor_owner_fp.dom_domain_agg2}
              AND ${fp_dimension_fields.ite_item_bulky_flg_plus_mlm_mla} = ${vendor_owner_fp.bulky_flg}
              AND ${fp_dimension_fields.ite_item_supermarket_flg}        = ${vendor_owner_fp.super_flg}
              AND ${fp_dimension_fields.sap_vendor_estimated}            = ${vendor_owner_fp.vendor}
        ;;
    }
    join: brand_owner_fp {
      from: vendor_owner_fp
      type: left_outer
      relationship: one_to_one
      sql_on:     ${fp_dimension_fields.sit_site_id}                     = ${brand_owner_fp.sit_site_id}
              AND ${fp_dimension_fields.dom_domain_agg2}                 = ${brand_owner_fp.dom_domain_agg2}
              AND ${fp_dimension_fields.ite_item_bulky_flg_plus_mlm_mla} = ${brand_owner_fp.bulky_flg}
              AND ${fp_dimension_fields.ite_item_supermarket_flg}        = ${brand_owner_fp.super_flg}
              AND ${fp_dimension_fields.ite_item_brand}                  = ${brand_owner_fp.brand}
              AND ${fp_dimension_fields.sap_vendor_estimated}   = ${brand_owner_fp.vendor_s}
        ;;
    }

    join: lk_1p_vertical_owner {
      from: lk_1p_vertical_owner
      type: left_outer
      relationship: one_to_one
      sql_on:     ${fp_dimension_fields.sit_site_id}     = ${lk_1p_vertical_owner.sit_site_id}
              AND ${fp_dimension_fields.vertical_domain} = ${lk_1p_vertical_owner.vertical}
        ;;
    }


  }
