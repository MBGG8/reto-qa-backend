function fn() {
  var env = karate.env || 'dev';
  karate.log('Running environment:', env);

  var config = {
    env: env,
    baseUrl: 'https://serverest.dev',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  if (env === 'dev') {
    config.baseUrl = 'https://serverest.dev';
  } else if (env === 'qa') {
    config.baseUrl = 'https://serverest.dev';
  }

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('headers', config.headers);

  return config;
}