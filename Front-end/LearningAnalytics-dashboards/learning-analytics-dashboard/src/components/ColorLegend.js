import React, { useContext } from 'react'
import ColorContext from '../context/colors/colorsContext'

export default function ColorLegend() {
  const colorContext = useContext(ColorContext)
  const { palette } = colorContext

  return (
    <div className='color-legend'>
      <span className='color-legend-title'>Success Rate →</span>
      <div
        style={{
          height: '1rem',
          display: 'flex',
          justifyContent: 'center'
        }}
      >

        {palette.map((color, i) => (
          <div style={{ width: '10%', background: color}} key={i}>
           <br />
          </div>
        ))}
      </div>
    </div>
  )
}
