include: "/commerce_first_party/data_portal/extended_views/fp_inventory_metrics_aligned.view.lkml"


explore: fp_inventory_metrics_aligned {
  hidden: yes
  description: "Este explore no queda a la vista de los usuarios"
  from: fp_inventory_metrics_aligned

  always_filter: {
    filters: [fp_inventory_metrics_aligned.sit_site_id: "MLA,MLB,MLC,MLM,MCO"]
  }
}
