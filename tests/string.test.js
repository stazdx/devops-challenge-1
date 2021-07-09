const { greating, bye } = require('../utils/string');

test('Greating father', () => {
    expect(greating('Father')).toBe('hi Father');
});


test('Bye mother', () => {
    expect(bye('mother')).toBe('bye bye mother');
});