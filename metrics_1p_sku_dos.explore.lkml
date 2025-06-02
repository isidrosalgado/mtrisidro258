include: "/commerce_first_party/data_portal/extended_views/metrics_1p_sku_dos.view.lkml"
include: "/utilities/fp_parameters.view.lkml"


explore: metrics_1p_sku_dos{
  sql_always_where: ${period_filter} and ${closed_period_filter} ;;
  group_label: "x.Explore SKU-Item"
  label: "Explore SKU-Item"
  description: "Data Portal es una herramienta de análisis de datos de 1P que proporciona escalabilidad y dinamismo. Con ella, podemos reducir el trabajo manual y el esfuerzo de los equipos, a la vez que ofrecemos una fuente confiable que consolida variados datos de 1P en un solo lugar. Al hacerlo, se promueve la autonomía para construir y automatizar informes de forma self-service."
  always_filter: {
    filters: [select_period_metrics_1p: "",metrics_1p_sku_dos.sit_site_id: "MLM, MLB, MLC, MLA, MCO", metrics_1p_sku_dos.date_day_date: "this year to day"]
  }
}

#Enhancements to metrics_1p explore are defined in separate file.  Feature can be disabled by removing or commenting out the include
include: "/utilities/ctc_metrics_1p_sku_dos.lkml"
