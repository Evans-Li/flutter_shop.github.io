const serviceUrl = 'http://172.24.88.135:7001/default/';
// const serviceUrl = 'http://127.0.0.1:7001/default/';

const servicePath = {
  'homeData': serviceUrl+'homeData',// 首页数据
  'homeHotGoods': serviceUrl + 'getHomeHotGoods',  // 火爆商品 首页上拉加载商品
  'categoty': serviceUrl + 'getCategory', // 分类页
};