const { greating, bye } = require('../utils/string');

test('Greating father', () => {
    expect(greating('Father')).toBe('Hi Father');
});


test('Bye mother', () => {
    expect(bye('mother')).toBe('Bye bye mother');
});