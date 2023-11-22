describe('Product details page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });
  

  it('add to cart count changes when product is added to it', () => {
    cy.contains('My Cart (0)')
    cy.contains('Add').first().click({force: true})
    cy.contains('My Cart (1)')
  })
})