describe('Product details page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  it('should show the product page when clicked', () => {
    cy.get('article').first().click();
    cy.get('.product-detail').should('be.visible')
  })
})