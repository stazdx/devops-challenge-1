const Koa = require('koa');
const Router = require('koa-router');
const app = new Koa();
const router = new Router();

app.use(router.routes());

const root = {
    msg: "Easy peasy lemon squeezy ;)",
};
const cheerUp = {
    msg: "You can do it :)",
};
const cheerUpBase64 = {
    private_token: "VmFzIG11eSBiaWVuIQo=",
};

router.get('/', async ctx => {
  ctx.body = root;
  ctx.status = 200;
});

router.get('/cheers',  async ctx => {
  ctx.body = cheerUp;
  ctx.status = 200;
});

router.get('/private', async ctx => {
  ctx.body = cheerUpBase64;
  ctx.status = 200;
});

app.listen(3000, async () => {
  console.log('Listening on port 3000!');
});
