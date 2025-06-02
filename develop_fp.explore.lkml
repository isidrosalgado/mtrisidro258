include: "/commerce_first_party/data_portal/extended_views/fp_dimension_fields_periods.view.lkml"
include: "/utilities/parameters.view"

include: "/commerce_first_party/data_portal/extended_views/fp_inventory_metrics.view"
include: "/commerce_first_party/data_portal/extended_views/fp_orders.view"
include: "/commerce_first_party/data_portal/extended_views/fp_ue_managerial.view"
include: "/commerce_first_party/data_portal/extended_views/fp_oos_historico.view"
include: "/commerce_first_party/data_portal/extended_views/fp_purchase_order.view"
include: "/commerce_first_party/data_portal/extended_views/fp_share_metrics.view.lkml"
include: "/commerce_first_party/data_portal/extended_views/fp_pricing.view"
include: "/commerce_first_party/data_portal/extended_views/fp_visits.view.lkml"
include: "/commerce_first_party/data_portal/extended_views/fp_planes.view.lkml"
include: "/commerce_first_party/data_portal/extended_views/fp_selection_funnel.view.lkml"
include: "/commerce_first_party/data_portal/extended_views/fp_sales_tracker.view.lkml"
include: "/commerce_first_party/data_portal/extended_views/fp_bpc_favorability.view.lkml"

include: "/commerce_first_party/data_portal/extended_views/fp_ue_managerial_ph.view.lkml"

include: "/commerce_first_party/data_portal/extended_views/fp_ue_consolidated.view.lkml"



explore: develop_fp {
  hidden: yes

  view_name: fp_dimension_fields_periods


  join: refactoring_orders_sku_dos {
    from: fp_orders
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${refactoring_orders_sku_dos.date_day}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${refactoring_orders_sku_dos.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${refactoring_orders_sku_dos.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.ite_item_id}      = ${refactoring_orders_sku_dos.ite_item_id}
        AND ${fp_dimension_fields_periods.period_type}      = ${refactoring_orders_sku_dos.period_type}
        ;;
  }

  join: inventory_metrics_sku_bi {
    from: fp_inventory_metrics
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${inventory_metrics_sku_bi.ord_closed_date}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${inventory_metrics_sku_bi.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${inventory_metrics_sku_bi.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.ite_item_id}      = ${inventory_metrics_sku_bi.ite_item_id}
        AND ${fp_dimension_fields_periods.period_type}      = ${inventory_metrics_sku_bi.period_type}
        ;;
  }

  join: bt_ue_output_managerial_1p_sku_dos {
    from: fp_ue_managerial
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${bt_ue_output_managerial_1p_sku_dos.dia_final}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${bt_ue_output_managerial_1p_sku_dos.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${bt_ue_output_managerial_1p_sku_dos.ite_item_sku_id}
        AND ${fp_dimension_fields_periods.ite_item_id}      = ${bt_ue_output_managerial_1p_sku_dos.ite_item_id}
        AND ${fp_dimension_fields_periods.period_type}      = ${bt_ue_output_managerial_1p_sku_dos.period_type}
        ;;
  }

  join: fp_ue_managerial_ph {
    from: fp_ue_managerial_ph
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${fp_ue_managerial_ph.dia_final}
       AND ${fp_dimension_fields_periods.sit_site_id}      = ${fp_ue_managerial_ph.sit_site_id}
       AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${fp_ue_managerial_ph.ite_item_sap_sku}
       AND ${fp_dimension_fields_periods.ite_item_id}      = ${fp_ue_managerial_ph.ite_item_id}
       AND ${fp_dimension_fields_periods.period_type}      = ${fp_ue_managerial_ph.period_type}
       ;;
  }


  join: fp_pricing {
    from: fp_pricing
    type: left_outer
    relationship: one_to_one
    sql_on:  ${fp_dimension_fields_periods.ord_closed_dt}      = ${fp_pricing.tim_day}
        AND  ${fp_dimension_fields_periods.sit_site_id}        = ${fp_pricing.sit_site_id}
        AND  ${fp_dimension_fields_periods.period_type}        = ${fp_pricing.period_type}
        AND  ${fp_dimension_fields_periods.ite_item_id}        = ${fp_pricing.ite_item_id}
        AND  ${fp_dimension_fields_periods.ite_item_sap_sku}   = ${fp_pricing.ite_item_sap_sku}
        ;;
  }

  join: fp_visits {
    from: fp_visits
    type: left_outer
    relationship: one_to_one
    sql_on:  ${fp_dimension_fields_periods.ord_closed_dt}      = ${fp_visits.tim_day}
        AND  ${fp_dimension_fields_periods.sit_site_id}        = ${fp_visits.sit_site_id}
        AND  ${fp_dimension_fields_periods.period_type}        = ${fp_visits.period_type}
        AND  ${fp_dimension_fields_periods.ite_item_id}        = ${fp_visits.ite_item_id}
        AND  ${fp_dimension_fields_periods.ite_item_sap_sku}   = ${fp_visits.ite_item_sap_sku}
        ;;
  }

  join: fp_purchase_order {
    from: fp_purchase_order
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${fp_purchase_order.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${fp_purchase_order.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${fp_purchase_order.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.period_type}      = ${fp_purchase_order.period_type}
        AND ${fp_dimension_fields_periods.ite_item_id_join} = ${fp_purchase_order.ite_item_id_join}
        ;;
  }

  join: oos_sku {
    from: fp_oos_historico
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${oos_sku.tim_day}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${oos_sku.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${oos_sku.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.period_type}      = ${oos_sku.period_type}
        AND ${fp_dimension_fields_periods.ite_item_id_join} = ${oos_sku.ite_item_id_join}
        ;;
  }

  join: fp_selection_funnel {
    from: fp_selection_funnel
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${fp_selection_funnel.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${fp_selection_funnel.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${fp_selection_funnel.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.period_type}      = ${fp_selection_funnel.period_type}
        AND ${fp_dimension_fields_periods.ite_item_id_join} = ${fp_selection_funnel.ite_item_id_join}
        ;;
  }

  join: fp_share_metrics {
    from: fp_share_metrics
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${fp_share_metrics.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${fp_share_metrics.sit_site_id}
        AND ${fp_dimension_fields_periods.period_type}      = ${fp_share_metrics.period_type}
        AND ${fp_dimension_fields_periods.dom_domain_agg2}  = ${fp_share_metrics.dom_domain_agg2}
        AND ${fp_dimension_fields_periods.plan_version} = "Actual"
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} IS NULL
        AND ${fp_dimension_fields_periods.ite_item_id}      IS NULL
      ;;
  }

  join: fp_planes {
    from: fp_planes
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${fp_planes.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${fp_planes.sit_site_id}
        AND ${fp_dimension_fields_periods.period_type}      = ${fp_planes.period_type}
        AND ${fp_dimension_fields_periods.dom_domain_agg2}  = ${fp_planes.dom_domain_agg2}
        AND ${fp_dimension_fields_periods.ite_item_bulky_flg_plus_mlm_mla} = ${fp_planes.ite_item_bulky_flg_plus_mlm_mla}
        AND ${fp_dimension_fields_periods.ite_item_supermarket_flg} = ${fp_planes.ite_item_supermarket_flg}
        AND ${fp_dimension_fields_periods.sap_vendor_estimated} = ${fp_planes.sap_vendor_estimated}
        AND ${fp_dimension_fields_periods.plan_version}  =  ${fp_planes.plan_version}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} IS NULL
        AND ${fp_dimension_fields_periods.ite_item_id}      IS NULL

      ;;
  }

  join: fp_sales_tracker {
    from: fp_sales_tracker
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${fp_sales_tracker.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${fp_sales_tracker.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${fp_sales_tracker.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.period_type}      = ${fp_sales_tracker.period_type}
        AND ${fp_dimension_fields_periods.ite_item_id_join} = ${fp_sales_tracker.ite_item_id_join}
        ;;
  }

  join: ue_consolidated {
    from: fp_ue_consolidated
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${ue_consolidated.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${ue_consolidated.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${ue_consolidated.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.period_type}      = ${ue_consolidated.period_type}
        AND ${fp_dimension_fields_periods.ite_item_id}      = ${ue_consolidated.ite_item_id}
        ;;
  }

  join: bpc_favorability {
    from: fp_bpc_favorability
    type: left_outer
    relationship: one_to_one
    sql_on: ${fp_dimension_fields_periods.ord_closed_dt}    = ${bpc_favorability.ord_closed_dt}
        AND ${fp_dimension_fields_periods.sit_site_id}      = ${bpc_favorability.sit_site_id}
        AND ${fp_dimension_fields_periods.ite_item_sap_sku} = ${bpc_favorability.ite_item_sap_sku}
        AND ${fp_dimension_fields_periods.ite_item_id}      = ${bpc_favorability.ite_item_id}
        AND ${fp_dimension_fields_periods.period_type}      = ${bpc_favorability.period_type}
        ;;
  }

}