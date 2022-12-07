import React, { useEffect, useContext } from 'react'
import { ResponsiveHeatMap } from '@nivo/heatmap'
import getFillColor from '../utils/getFillColor'
import StudentContext from '../context/students/studentContext'
import ColorsContext from '../context/colors/colorsContext'
import Loader from './Loader'

const CustomToolTip = ({ cell }) => {
  return (
      <div
          style={{
              backgroundColor: "rgba(13, 12, 12, .7)",
              color: '#FFF',
              padding: '6px 9px',
              borderRadius: '2px',
              minWidth: '160px',
              boxShadow: '0 3px 5px rgba(0, 0, 0, .25)',
              whiteSpace: 'pre'
          }}
      >
      <span>{cell.serieId} had {cell.data.y} attempts and {cell.data.successRate * 100}% success rate in {cell.data.x}</span>
      </div>
  )
}

const CustomCell = ({ onMouseLeave, onMouseEnter, cell, borderWidth }) => {
  const colorsContext = useContext(ColorsContext)
  const { palette } = colorsContext

  const { density, fillColor, size } = getFillColor(cell.data.successRate, palette)
  const fillColorIndex = palette.indexOf(fillColor)

  return (
    <g
    onMouseEnter={onMouseEnter(cell)}
    onMouseLeave={onMouseLeave(cell)}
    style={{ cursor: 'pointer' }}
    >
      <defs>
        <pattern id={`dots-l-${fillColor}`} x="0" y="0" width={density} height={density} patternUnits="userSpaceOnUse">
          <circle cx="20" cy="20" r="40" fill={fillColor} />
          <circle cx={size} cy={size} r={size} fill='#FFF' />
        </pattern>
      </defs>

      <circle
        cx={cell.x}
        cy={cell.y}
        r={Math.min(cell.width, cell.height) / 2}
        fill={`url(#dots-l-${fillColor})`}
      >
        &nbsp;
      </circle>
    </g>
  )
}

const MyResponsiveHeatMap = ({ data }) => (
  <ResponsiveHeatMap
    data={data}
    margin={{ top: 150, right: 0, bottom: 10, left: 70 }}
    axisTop={{
      tickRotation: -90,
    }}
    axisLeft={{
      legend: 'students',
      legendPosition: 'middle',
      legendOffset: -60,
    }}
    valueFormat=">-.2s"
    enableGridX={true}
    tooltip={CustomToolTip}
    cellComponent={CustomCell}
    sizeVariation={{
      sizes: [0.5, 1],
    }}
    style={{backgroundColor: '#FFF'}}
  />
)

export default function HeatMap() {
  const studentContext = useContext(StudentContext)
  const { getInfo, getFakeInfo, loading, info, students} = studentContext

  useEffect(() => {
    getInfo()
  }, [])


  return (
    <>
      {loading ? (
        <Loader />
      ) : (
        <div className="heatmap">
          <MyResponsiveHeatMap data={students} />
        </div>
      )}
    </>
  )
}
