// Grant CesiumJS access to your ion assets
Cesium.Ion.defaultAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJhZTUxM2JiNy05NDBmLTQwYzAtYWI4Ni1jNmY3YWE3ZWYwMGIiLCJpZCI6MjAwMjM4LCJpYXQiOjE3MDk3OTg5NzZ9.99UasHfZKBL_F4fbfE8ppqwb6GjaQXg-K5itYiWgJiI";

const viewer = new Cesium.Viewer("cesiumContainer", {
  terrainProvider: await Cesium.CesiumTerrainProvider.fromIonAssetId(
    1,
  ),
});
viewer.scene.globe.depthTestAgainstTerrain = true;

try {
  const tileset = await Cesium.Cesium3DTileset.fromIonAssetId(2491357);
  viewer.scene.primitives.add(tileset);
  await viewer.zoomTo(tileset);

  // Apply the default style if it exists
  const extras = tileset.asset.extras;
  if (
    Cesium.defined(extras) &&
    Cesium.defined(extras.ion) &&
    Cesium.defined(extras.ion.defaultStyle)
  ) {
    tileset.style = new Cesium.Cesium3DTileStyle(extras.ion.defaultStyle);
  }
} catch (error) {
  console.log(error);
}