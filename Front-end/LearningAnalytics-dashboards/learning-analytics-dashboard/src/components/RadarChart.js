import { ResponsiveRadar } from '@nivo/radar'

const data = [
  {
    "taste": "fruity",
    "chardonay": 57,
    "carmenere": 106,
    "syrah": 116
  },
  {
    "taste": "bitter",
    "chardonay": 72,
    "carmenere": 74,
    "syrah": 33
  },
  {
    "taste": "heavy",
    "chardonay": 115,
    "carmenere": 86,
    "syrah": 53
  },
  {
    "taste": "strong",
    "chardonay": 102,
    "carmenere": 47,
    "syrah": 49
  },
  {
    "taste": "sunny",
    "chardonay": 84,
    "carmenere": 87,
    "syrah": 119
  }
]

export default function MyResponsiveRadar() {
  return (
    <div style={{ height:'20rem' }}>
      <ResponsiveRadar
        data={data}
        keys={['chardonay', 'carmenere', 'syrah']}
        indexBy="taste"
        valueFormat=">-.2f"
        margin={{ top: 70, right: 80, bottom: 40, left: 80 }}
        borderColor={{ from: 'color' }}
        gridLabelOffset={36}
        dotSize={10}
        dotColor={{ theme: 'background' }}
        dotBorderWidth={2}
        colors={{ scheme: 'nivo' }}
        blendMode="multiply"
        motionConfig="wobbly"
      />
    </div>
  )
}