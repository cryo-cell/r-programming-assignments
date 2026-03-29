\name{plot2}
\alias{plot2}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("plot2")}
\format{
  The format is:
<ggplot2::ggplot>
 @ data       : spc_tbl_ [574 × 7] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ date    : Date[1:574], format: "1967-07-01" "1967-08-01" "1967-09-01" "1967-10-01" ...
 $ pce     : num [1:574] 507 510 516 512 517 ...
 $ pop     : num [1:574] 198712 198911 199113 199311 199498 ...
 $ psavert : num [1:574] 12.6 12.6 11.9 12.9 12.8 11.8 11.7 12.3 11.7 12.3 ...
 $ uempmed : num [1:574] 4.5 4.7 4.6 4.9 4.7 4.8 5.1 4.5 4.1 4.6 ...
 $ unemploy: num [1:574] 2944 2945 2958 3143 3066 ...
 $ year    : num [1:574] 1967 1967 1967 1967 1967 ...
 @ layers     :List of 2
 .. $ geom_point:Classes 'LayerInstance', 'Layer', 'ggproto', 'gg' <ggproto object: Class LayerInstance, Layer, gg>
    aes_params: list
    compute_aesthetics: function
    compute_geom_1: function
    compute_geom_2: function
    compute_position: function
    compute_statistic: function
    computed_geom_params: list
    computed_mapping: ggplot2::mapping, uneval, gg, S7_object
    computed_stat_params: list
    constructor: call
    data: waiver
    draw_geom: function
    finish_statistics: function
    geom: <ggproto object: Class GeomPoint, Geom, gg>
        aesthetics: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        draw_group: function
        draw_key: function
        draw_layer: function
        draw_panel: function
        extra_params: na.rm
        handle_na: function
        non_missing_aes: size shape colour
        optional_aes: 
        parameters: function
        rename_size: FALSE
        required_aes: x y
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Geom, gg>
    geom_params: list
    inherit.aes: TRUE
    layer_data: function
    layout: NULL
    map_statistic: function
    mapping: NULL
    name: NULL
    position: <ggproto object: Class PositionIdentity, Position, gg>
        aesthetics: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        required_aes: 
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Position, gg>
    print: function
    setup_layer: function
    show.legend: NA
    stat: <ggproto object: Class StatIdentity, Stat, gg>
        aesthetics: function
        compute_group: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        dropped_aes: 
        extra_params: na.rm
        finish_layer: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        required_aes: 
        retransform: TRUE
        setup_data: function
        setup_params: function
        super:  <ggproto object: Class Stat, gg>
    stat_params: list
    super:  <ggproto object: Class Layer, gg> 
 .. $ geom_path :Classes 'LayerInstance', 'Layer', 'ggproto', 'gg' <ggproto object: Class LayerInstance, Layer, gg>
    aes_params: list
    compute_aesthetics: function
    compute_geom_1: function
    compute_geom_2: function
    compute_position: function
    compute_statistic: function
    computed_geom_params: list
    computed_mapping: ggplot2::mapping, uneval, gg, S7_object
    computed_stat_params: list
    constructor: call
    data: waiver
    draw_geom: function
    finish_statistics: function
    geom: <ggproto object: Class GeomPath, Geom, gg>
        aesthetics: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        draw_group: function
        draw_key: function
        draw_layer: function
        draw_panel: function
        extra_params: na.rm
        handle_na: function
        non_missing_aes: linewidth colour linetype
        optional_aes: 
        parameters: function
        rename_size: TRUE
        required_aes: x y
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Geom, gg>
    geom_params: list
    inherit.aes: TRUE
    layer_data: function
    layout: NULL
    map_statistic: function
    mapping: NULL
    name: NULL
    position: <ggproto object: Class PositionIdentity, Position, gg>
        aesthetics: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        required_aes: 
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Position, gg>
    print: function
    setup_layer: function
    show.legend: NA
    stat: <ggproto object: Class StatIdentity, Stat, gg>
        aesthetics: function
        compute_group: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        dropped_aes: 
        extra_params: na.rm
        finish_layer: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        required_aes: 
        retransform: TRUE
        setup_data: function
        setup_params: function
        super:  <ggproto object: Class Stat, gg>
    stat_params: list
    super:  <ggproto object: Class Layer, gg> 
 @ scales     :Classes 'ScalesList', 'ggproto', 'gg' <ggproto object: Class ScalesList, gg>
    add: function
    add_defaults: function
    add_missing: function
    backtransform_df: function
    clone: function
    find: function
    get_scales: function
    has_scale: function
    input: function
    map_df: function
    n: function
    non_position_scales: function
    scales: list
    set_palettes: function
    train_df: function
    transform_df: function
    super:  <ggproto object: Class ScalesList, gg> 
 @ guides     :Classes 'Guides', 'ggproto', 'gg' <ggproto object: Class Guides, gg>
    add: function
    assemble: function
    build: function
    draw: function
    get_custom: function
    get_guide: function
    get_params: function
    get_position: function
    guides: NULL
    merge: function
    missing: <ggproto object: Class GuideNone, Guide, gg>
        add_title: function
        arrange_layout: function
        assemble_drawing: function
        available_aes: any
        build_decor: function
        build_labels: function
        build_ticks: function
        build_title: function
        draw: function
        draw_early_exit: function
        elements: list
        extract_decor: function
        extract_key: function
        extract_params: function
        get_layer_key: function
        hashables: list
        measure_grobs: function
        merge: function
        override_elements: function
        params: list
        process_layers: function
        setup_elements: function
        setup_params: function
        train: function
        transform: function
        super:  <ggproto object: Class GuideNone, Guide, gg>
    package_box: function
    print: function
    process_layers: function
    setup: function
    subset_guides: function
    train: function
    update_params: function
    super:  <ggproto object: Class Guides, gg> 
 @ mapping    : <ggplot2::mapping> List of 3
 .. $ x     : language ~unemploy/pop
 ..  ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
 .. $ y     : language ~uempmed
 ..  ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
 .. $ colour: language ~year
 ..  ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
 @ theme      : <theme>  Named list()
 .. @ complete: logi FALSE
 .. @ validate: logi TRUE
 @ coordinates:Classes 'CoordCartesian', 'Coord', 'ggproto', 'gg' <ggproto object: Class CoordCartesian, Coord, gg>
    aspect: function
    backtransform_range: function
    clip: on
    default: TRUE
    distance: function
    draw_panel: function
    expand: TRUE
    is_free: function
    is_linear: function
    labels: function
    limits: list
    modify_scales: function
    range: function
    ratio: NULL
    render_axis_h: function
    render_axis_v: function
    render_bg: function
    render_fg: function
    reverse: none
    setup_data: function
    setup_layout: function
    setup_panel_guides: function
    setup_panel_params: function
    setup_params: function
    train_panel_guides: function
    transform: function
    super:  <ggproto object: Class CoordCartesian, Coord, gg> 
 @ facet      :Classes 'FacetNull', 'Facet', 'ggproto', 'gg' <ggproto object: Class FacetNull, Facet, gg>
    attach_axes: function
    attach_strips: function
    compute_layout: function
    draw_back: function
    draw_front: function
    draw_labels: function
    draw_panel_content: function
    draw_panels: function
    finish_data: function
    format_strip_labels: function
    init_gtable: function
    init_scales: function
    map_data: function
    params: list
    set_panel_size: function
    setup_data: function
    setup_panel_params: function
    setup_params: function
    shrink: TRUE
    train_scales: function
    vars: function
    super:  <ggproto object: Class FacetNull, Facet, gg> 
 @ layout     :Classes 'Layout', 'ggproto', 'gg' <ggproto object: Class Layout, gg>
    coord: NULL
    coord_params: list
    facet: NULL
    facet_params: list
    finish_data: function
    get_scales: function
    layout: NULL
    map_position: function
    panel_params: NULL
    panel_scales_x: NULL
    panel_scales_y: NULL
    render: function
    render_labels: function
    reset_scales: function
    resolve_label: function
    setup: function
    setup_panel_guides: function
    setup_panel_params: function
    train_position: function
    super:  <ggproto object: Class Layout, gg> 
 @ labels     : <ggplot2::labels> List of 2
 .. $ y: chr "uempmed"
 .. $ x: chr "unemploy/pop"
 @ meta       : list()
 @ plot_env   :<environment: R_GlobalEnv> 
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(plot2)
## maybe str(plot2) ; plot(plot2) ...
}
\keyword{datasets}
