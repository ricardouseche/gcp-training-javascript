// tests/server.test.js
const request = require('supertest');
const app = require('./server');

describe('GET /', () => {
  it('should respond with Hello World! JSON', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.headers['content-type']).toMatch(/json/);
    expect(response.body).toEqual({ message: 'Hello World!' });
  });
});

describe('GET /health', () => {
  it('should respond with status ok JSON', async () => {
    const response = await request(app).get('/health');
    expect(response.statusCode).toBe(200);
    expect(response.headers['content-type']).toMatch(/json/);
    expect(response.body).toEqual({ status: 'ok' });
  });
});

describe('GET /nonexistentpath', () => {
    it('should respond with 404', async () => {
      const response = await request(app).get('/nonexistentpath');
      expect(response.statusCode).toBe(404);
    });
  });