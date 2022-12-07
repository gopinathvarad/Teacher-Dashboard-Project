import { ResponsiveBar } from '@nivo/bar'

const data = [
  {
    "country": "AD",
    "hot dog": 189,
    "hot dogColor": "hsl(348, 70%, 50%)",
    "burger": 165,
    "burgerColor": "hsl(312, 70%, 50%)",
    "sandwich": 63,
    "sandwichColor": "hsl(317, 70%, 50%)",
    "kebab": 124,
    "kebabColor": "hsl(98, 70%, 50%)",
    "fries": 121,
    "friesColor": "hsl(147, 70%, 50%)",
    "donut": 86,
    "donutColor": "hsl(149, 70%, 50%)"
  },
  {
    "country": "AE",
    "hot dog": 155,
    "hot dogColor": "hsl(175, 70%, 50%)",
    "burger": 105,
    "burgerColor": "hsl(313, 70%, 50%)",
    "sandwich": 31,
    "sandwichColor": "hsl(66, 70%, 50%)",
    "kebab": 156,
    "kebabColor": "hsl(270, 70%, 50%)",
    "fries": 114,
    "friesColor": "hsl(107, 70%, 50%)",
    "donut": 125,
    "donutColor": "hsl(228, 70%, 50%)"
  },
  {
    "country": "AF",
    "hot dog": 120,
    "hot dogColor": "hsl(202, 70%, 50%)",
    "burger": 109,
    "burgerColor": "hsl(298, 70%, 50%)",
    "sandwich": 198,
    "sandwichColor": "hsl(355, 70%, 50%)",
    "kebab": 163,
    "kebabColor": "hsl(53, 70%, 50%)",
    "fries": 52,
    "friesColor": "hsl(273, 70%, 50%)",
    "donut": 134,
    "donutColor": "hsl(161, 70%, 50%)"
  },
  {
    "country": "AG",
    "hot dog": 180,
    "hot dogColor": "hsl(59, 70%, 50%)",
    "burger": 138,
    "burgerColor": "hsl(95, 70%, 50%)",
    "sandwich": 104,
    "sandwichColor": "hsl(286, 70%, 50%)",
    "kebab": 108,
    "kebabColor": "hsl(225, 70%, 50%)",
    "fries": 19,
    "friesColor": "hsl(163, 70%, 50%)",
    "donut": 121,
    "donutColor": "hsl(326, 70%, 50%)"
  },
  {
    "country": "AI",
    "hot dog": 66,
    "hot dogColor": "hsl(180, 70%, 50%)",
    "burger": 87,
    "burgerColor": "hsl(219, 70%, 50%)",
    "sandwich": 130,
    "sandwichColor": "hsl(272, 70%, 50%)",
    "kebab": 79,
    "kebabColor": "hsl(234, 70%, 50%)",
    "fries": 108,
    "friesColor": "hsl(13, 70%, 50%)",
    "donut": 50,
    "donutColor": "hsl(291, 70%, 50%)"
  },
  {
    "country": "AL",
    "hot dog": 40,
    "hot dogColor": "hsl(87, 70%, 50%)",
    "burger": 168,
    "burgerColor": "hsl(190, 70%, 50%)",
    "sandwich": 30,
    "sandwichColor": "hsl(310, 70%, 50%)",
    "kebab": 29,
    "kebabColor": "hsl(160, 70%, 50%)",
    "fries": 31,
    "friesColor": "hsl(45, 70%, 50%)",
    "donut": 144,
    "donutColor": "hsl(62, 70%, 50%)"
  },
  {
    "country": "AM",
    "hot dog": 54,
    "hot dogColor": "hsl(98, 70%, 50%)",
    "burger": 118,
    "burgerColor": "hsl(167, 70%, 50%)",
    "sandwich": 196,
    "sandwichColor": "hsl(155, 70%, 50%)",
    "kebab": 177,
    "kebabColor": "hsl(67, 70%, 50%)",
    "fries": 42,
    "friesColor": "hsl(48, 70%, 50%)",
    "donut": 133,
    "donutColor": "hsl(45, 70%, 50%)"
  }
]

export default function MyResponsiveBar() {
  return (
    <div style={{height: '40vh'}}>
      <ResponsiveBar
      data={data}
      keys={[
        'hot dog',
        'burger',
        'sandwich',
        'kebab',
        'fries',
        'donut'
      ]}
      indexBy="country"
        margin={{ top: 50, right: 130, bottom: 50, left: 60 }}
        padding={0.3}
        valueScale={{ type: 'linear' }}
        indexScale={{ type: 'band', round: true }}
        colors={{ scheme: 'nivo' }}
        defs={[
            {
                id: 'dots',
                type: 'patternDots',
                background: 'inherit',
                color: '#38bcb2',
                size: 4,
                padding: 1,
                stagger: true
            },
            {
                id: 'lines',
                type: 'patternLines',
                background: 'inherit',
                color: '#eed312',
                rotation: -45,
                lineWidth: 6,
                spacing: 10
            }
        ]}
        fill={[
            {
                match: {
                    id: 'fries'
                },
                id: 'dots'
            },
            {
                match: {
                    id: 'sandwich'
                },
                id: 'lines'
            }
        ]}
        borderColor={{
            from: 'color',
            modifiers: [
                [
                    'darker',
                    1.6
                ]
            ]
        }}
        axisTop={null}
        axisRight={null}
        axisBottom={{
            tickSize: 5,
            tickPadding: 5,
            tickRotation: 0,
            legend: 'country',
            legendPosition: 'middle',
            legendOffset: 32
        }}
        axisLeft={{
            tickSize: 5,
            tickPadding: 5,
            tickRotation: 0,
            legend: 'food',
            legendPosition: 'middle',
            legendOffset: -40
        }}
        labelSkipWidth={12}
        labelSkipHeight={12}
        labelTextColor={{
            from: 'color',
            modifiers: [
                [
                    'darker',
                    1.6
                ]
            ]
        }}
        legends={[
            {
                dataFrom: 'keys',
                anchor: 'bottom-right',
                direction: 'column',
                justify: false,
                translateX: 120,
                translateY: 0,
                itemsSpacing: 2,
                itemWidth: 100,
                itemHeight: 20,
                itemDirection: 'left-to-right',
                itemOpacity: 0.85,
                symbolSize: 20,
                effects: [
                    {
                        on: 'hover',
                        style: {
                            itemOpacity: 1
                        }
                    }
                ]
            }
        ]}
        role="application"
        ariaLabel="Nivo bar chart demo"
        barAriaLabel={function(e){return e.id+": "+e.formattedValue+" in country: "+e.indexValue}}
    />
    </div>
  )
}