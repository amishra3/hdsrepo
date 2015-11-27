"use strict";
window.cl = console.dir.bind(console);
var ResponsiveBootstrapToolkit = ResponsiveBootstrapToolkit || {};
! function(e) {
    var i = e(".hero");
    e(".close-hero").click(function() {
        i.siblings(".general").fadeIn(1e3), i.siblings(".healthcare").hide()
    }), e(".general-healthcare").click(function() {
        i.siblings(".healthcare").fadeIn(1e3), i.siblings(".general").hide()
    })
}(jQuery);