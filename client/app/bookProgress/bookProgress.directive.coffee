'use strict'

angular.module 'csiiApp'
.directive 'bookProgress', ->
  restrict: 'E',
  scope:
    data: "="
    format: "="
  link: (scope, element, attrs) ->

    width = if scope.format then scope.format.width else 300
    height = if scope.format then scope.format.height else 300

    radius = Math.min(width, height) / 2;

    tweenArc = (b) ->
      (a) ->
        i = d3.interpolate b,a
        a[key] = b[key] for key of b
        (t) ->
          arc i t

    arcTween = () ->
      d3.select this
        .transition()
        .duration 2500
        .attrTween 'd', tweenArc { value: 0 }

    arc = d3.svg.arc()
    .outerRadius(radius - 10)
    .innerRadius(radius - 20)
    .startAngle 0
    .endAngle (d) -> d.value * 2 * Math.PI

    svg = d3.select element[0]
      .append 'svg'
      .attr 'width', '100%'
      .attr 'height', height
        .append 'g'
      .attr 'transform', 'translate(' + width / 2 + ',' + height / 2 + ')'

    g = svg.selectAll 'g'
      .data scope.data
        .enter().append 'g'
      .attr 'class', 'arc'

    g.append 'path'
      .style 'fill', '#FF0100'
      .attr 'd', arc

    g.selectAll 'path'
      .each arcTween