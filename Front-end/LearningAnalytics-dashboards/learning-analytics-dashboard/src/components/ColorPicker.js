import React, { useContext } from 'react'
import ColorContext from '../context/colors/colorsContext'
//import palettes from '../utils/palettes'

export default function ColorPicker() {
  const colorContext = useContext(ColorContext)
  const { changePalette } = colorContext

  const palettes = [
      [
      '#ccece6', 
      '#99d8c9',
      '#66c2a4',
      '#41ae76',
      '#238b45',
      '#006d2c',
      '#00441b',
    ],
    [
      '#bfd3e6',
      '#9ebcda',
      '#8c96c6',
      '#8c6bb1',
      '#88419d',
      '#810f7c',
      '#4d004b',
    ],
    [
      '#ccebc5',
      '#a8ddb5',
      '#7bccc4',
      '#4eb3d3',
      '#2b8cbe',
      '#0868ac',
      '#084081',
    ],
    [
      '#fdd49e',
      '#fdbb84',
      '#fc8d59',
      '#ef6548',
      '#d7301f',
      '#b30000',
      '#7f0000',
    ] 
  ]

  return (
    <div className="color-picker-grp">
      {palettes.map((p, i) => {
        const colors = p.map((c, i) => {
          return (
            <div key={i} style={{ backgroundColor: c, width: '1rem', display: 'inline-block'}}>
              &nbsp;
            </div>)
        })

        return (<div key={i} className="color-picker" onClick={() => changePalette(p)}>{colors}</div>)
      })}
    </div>
  )
}
