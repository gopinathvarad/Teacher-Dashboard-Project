export default function getFillColor(successRate, colors) {
  if(successRate < .15) return {fillColor: colors[0], density: '16', size: '1.5'}
  if(successRate < .30) return {fillColor: colors[1], density: '15', size: '1.7'}
  if(successRate < .45) return {fillColor: colors[2], density: '14', size: '1.9'}
  if(successRate < .60) return {fillColor: colors[3], density: '13', size: '2.1'}
  if(successRate < .75) return {fillColor: colors[4], density: '12', size: '2.3'}
  if(successRate < .90) return {fillColor: colors[5], density: '11', size: '2.5'}
  if(successRate <= 1) return {fillColor: colors[6], density: '10', size: '2.7'}
}