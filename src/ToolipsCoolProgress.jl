module ToolipsCoolProgress
using Toolips
using ToolipsSVG

function circular_progress(name::String, args::Pair{String, <:Any} ...; keyargs ...)
    progrwindow = Component("progressbar", name, width = 100px, height = 100px)
    progrwindow.tag = "svg"
    indicator = ToolipsSVG.circle("$name-indicator", cx = 50px, cy = 50px, r = 40px)
    track = ToolipsSVG.circle("$name-track", cx = 50px, cy = 50px, r = 40px)
    style!(track, "fill" => "transparent", "stroke-width" => 10px, "stroke" => "lightblue", 
    "stroke-dasharray" => 20px, "dashoffset" => 20px)
    size = 100
    strokeWidth = 10
    center = size / 2
    radius = center - strokeWidth 
    progress = 0
    arcLength = 2 * π * radius
    arcOffset = arcLength * ((100 - progress)/100) 
    progrwindow::Component{:progressbar}
end

end # module ToolipsCoolProgress
