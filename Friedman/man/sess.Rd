\name{sess}
\alias{sess}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("sess")}
\format{
  The format is:
Classes 'LiveHTML', 'R6' <LiveHTML>
  Public:
    click: function (css, n_clicks = 1) 
    clone: function (deep = FALSE) 
    get_scroll_position: function () 
    html_elements: function (css, xpath) 
    initialize: function (url) 
    press: function (css, key_code, modifiers = character()) 
    print: function (...) 
    scroll_by: function (top = 0, left = 0) 
    scroll_into_view: function (css) 
    scroll_to: function (top = 0, left = 0) 
    session: ChromoteSession, R6
    type: function (css, text) 
    view: function () 
  Private:
    call_node_method: function (node_id, method, ...) 
    check_active: function () 
    finalize: function () 
    find_nodes: function (css, xpath) 
    object_id: function (node_id) 
    root_id: function () 
    wait_for_selector: function (css, timeout = 5)  
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
data(sess)
## maybe str(sess) ; plot(sess) ...
}
\keyword{datasets}
