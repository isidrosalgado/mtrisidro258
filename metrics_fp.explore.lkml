include: "/commerce_first_party/data_portal/extended_views/develop_fp.view.lkml"
include: "/utilities/fp_parameters.view.lkml"


explore: metrics_fp {
  hidden: no
  sql_always_where: ${period_filter} and ${closed_period_filter} ;;
  group_label: "x.Explore SKU-Item"
  #group_label: "Data Portal 1P"
  label: "Explore metrics_fp"
  from: develop_fp
  always_filter: {
    filters: [select_period_metrics_1p: "",metrics_fp.sit_site_id: "MLM, MLB, MLC, MLA, MCO", metrics_fp.date_day_date: "6 month"]
  }
}

#Enhancements to metrics_1p explore are defined in separate file.  Feature can be disabled by removing or commenting out the include
include: "/utilities/ctc_metrics_1p_sku_dos.lkml"
