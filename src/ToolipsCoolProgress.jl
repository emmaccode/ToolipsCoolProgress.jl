module ToolipsCoolProgress
using Toolips
using ToolipsSVG
using ToolipsSession: AbstractComponentModifier

function circular_progress(name::String, args::Pair{String, <:Any} ...; keyargs ...)
    progrwindow = Component(name, "cprogress")
    progrwindow.tag, progrwindow[:width], progrwindow[:height] = "svg", 100px, 100px
    indicator = ToolipsSVG.circle("$name-indicator", cx = 50px, cy = 50px, r = 40px)
    track = ToolipsSVG.circle("$name-track", cx = 50px, cy = 50px, r = 40px)
    style!(indicator, "fill" => "transparent", "stroke-width" => 7px, "stroke" => "darkgray", 
    "transition" => 1seconds)
    style!(track, "fill" => "transparent", "stroke-width" => 10px, "stroke" => "lightblue", 
    "stroke-dasharray" => 251px, "stroke-dashoffset" => 20px, "transition" => 1seconds)
    size = 100
    strokew = 10
    center = size / 2
    radius = center - strokew 
    progress = 25
    arclen = 2 * π * radius
    arc = Int64(round(arclen * ((100 - progress)/100))) 
    push!(progrwindow, indicator, track)
    style!(track, "stroke-dashoffset" => "$(arc)px")
    progrwindow[:arclen] = arclen
    progrwindow::Component{:cprogress}
end

function circular_progress_text(name::String, args::Pair{String, <:Any} ...; keyargs ...)
    progrwindow = Component(name, "cprogress")
    progrwindow.tag, progrwindow[:width], progrwindow[:height] = "svg", 100px, 100px
    indicator = ToolipsSVG.circle("$name-indicator", cx = 50px, cy = 50px, r = 40px)
    track = ToolipsSVG.circle("$name-track", cx = 50px, cy = 50px, r = 40px)
    style!(indicator, "fill" => "transparent", "stroke-width" => 7px, "stroke" => "darkgray", 
    "transition" => 1seconds)
    style!(track, "fill" => "transparent", "stroke-width" => 10px, "stroke" => "lightblue", 
    "stroke-dasharray" => 251px, "stroke-dashoffset" => 20px, "transition" => 1seconds)
    size = 100
    strokew = 10
    center = size / 2
    radius = center - strokew 
    progress = 25
    arclen = 2 * π * radius
    arc = Int64(round(arclen * ((100 - progress)/100))) 
    push!(progrwindow, indicator, track)
    style!(track, "stroke-dashoffset" => "$(arc)px")
    progrwindow[:arclen] = arclen
    progrwindow::Component{:cprogress}
end

function update_progress!(cm::AbstractComponentModifier, comp::Component{:cprogress}, n::Int64)
    arclen = comp[:arclen]
    arc = Int64(round(arclen* ((100 - n)/100)))
    style!(cm, comp[:children]["$(comp.name)-track"], "stroke-dashoffset" => "$(arc)px")
    return
end


function update_progress!(cm::AbstractComponentModifier, comp::Component{:textcprogress}, n::Int64, text::String)

end

export update_progress!

end # module ToolipsCoolProgress
