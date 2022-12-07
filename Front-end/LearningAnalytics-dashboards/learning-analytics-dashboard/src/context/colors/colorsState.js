import React, { useReducer } from 'react'
import ColorContext from './colorsContext'
import colorReducer from './colorsReducer'
import { CHANGE_PALETTE } from '../types'

const PaletteState = props => {
  const initialState = {
    palette: [
      '#ccece6', 
      '#99d8c9',
      '#66c2a4',
      '#41ae76',
      '#238b45',
      '#006d2c',
      '#00441b',
    ]
  }

  const [state, dispatch] = useReducer(colorReducer, initialState)

  const changePalette = (palette) => {
    dispatch({
      type: CHANGE_PALETTE,
      payload: palette
    })
  }

  return (
    <ColorContext.Provider value={{
      palette: state.palette,
      changePalette
    }}>
      {props.children}
    </ColorContext.Provider>
  )
}
export default PaletteState