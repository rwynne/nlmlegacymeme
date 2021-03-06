/*****************************************************************************
 *
 * Package: gov.nih.nlm.meme.qa.ic
 * Object:  DT_I13Test
 * 
 * 04/07/2006 RBE (1-AV8WP): File created
 *  
 *****************************************************************************/

package gov.nih.nlm.meme.integrity;

import gov.nih.nlm.meme.common.Atom;
import gov.nih.nlm.meme.common.Code;
import gov.nih.nlm.meme.common.Concept;
import gov.nih.nlm.meme.common.Source;
import gov.nih.nlm.meme.common.Termgroup;
import junit.framework.TestCase;

public class DT_I13Test extends TestCase {

	private Concept source = null;
	private DT_I13 ic = null;

	/* Code to set up a fresh scaffold for each test */
	protected void setUp() throws Exception {
		super.setUp();
		source = null;
		ic = new DT_I13();
		ic.setIsActive(true);
		ic.setIsFatal(true);
		ic.setShortDescription("Short description of DT_I13");
		ic.setDescription("Description of DT_I13.");

	}

	/* Code to destroy the scaffold after each test */
	protected void tearDown() throws Exception {
		super.tearDown();
	}

	//
	// Test and assert success
	//

	public void testViolationNotFoundNoAtoms() {
		System.out.println("DT_I13Test#testViolationNotFoundNoAtoms()");
		createConcept();
		assertTrue("No violation expected. No atoms attached to concept.", !ic.validate(source));
	}

	public void testViolationFound() {
		System.out.println("DT_I13Test#testViolationFound()");
		createSourceConcept();
		assertTrue("Violation expected.", ic.validate(source));
	}

	public void testViolationNotFoundSetCurrent() {
		System.out.println("DT_I13Test#testViolationNotFoundSetCurrent()");
		createSourceConceptSetCurrent();
		assertTrue("No violation expected.", !ic.validate(source));
	}

	public void testViolationNotFoundSetSAB() {
		System.out.println("DT_I13Test#testViolationNotFoundSetSAB()");
		createSourceConceptSetSAB();
		assertTrue("No violation expected.", !ic.validate(source));
	}

	public void testViolationNotFoundSetTTY() {
		System.out.println("DT_I13Test#testViolationNotFoundSetTTY()");
		createSourceConceptSetTTY();
		assertTrue("No violation expected.", !ic.validate(source));
	}

	public void testViolationNotFoundSetCode() {
		System.out.println("DT_I13Test#testViolationNotFoundSetCode()");
		createSourceConceptSetCode();
		assertTrue("No violation expected.", !ic.validate(source));
	}

	//
	// Test Cases
	//

	private void createConcept() {
		source = new Concept.Default();
	}

	private void createSourceConcept() {
		source = new Concept.Default();
		Atom atom = createAtom();
		atom.setConcept(source);
		source.addAtom(atom);
	}

	private void createSourceConceptSetCurrent() {
		source = new Concept.Default();
		Atom atom = createAtom();
		Source src = new Source.Default("MSH");
		src.setStrippedSourceAbbreviation("MSH");
		src.setIsCurrent(false);
		atom.setSource(src);
		atom.setConcept(source);
		source.addAtom(atom);
	}

	private void createSourceConceptSetSAB() {
		source = new Concept.Default();
		Atom atom = createAtom();
		Source src = new Source.Default("MSH");
		src.setStrippedSourceAbbreviation("MMM");
		atom.setSource(src);
		atom.setConcept(source);
		source.addAtom(atom);
	}

	private void createSourceConceptSetTTY() {
		source = new Concept.Default();
		Atom atom = createAtom();
		atom.setTermgroup(new Termgroup.Default("MSH/EN"));		
		atom.setConcept(source);
		source.addAtom(atom);
	}

	private void createSourceConceptSetCode() {
		source = new Concept.Default();
		Atom atom = createAtom();
		atom.setCode(Code.newCode("C000001"));		
		atom.setConcept(source);
		source.addAtom(atom);
	}

	//
	// Helper method(s)
	//

	private Atom createAtom() {
		Atom atom = new Atom.Default();
		atom.setString("TEST ATOM");
		atom.setTermgroup(new Termgroup.Default("MSH/PM"));		
		Source src = new Source.Default("MSH");
		src.setStrippedSourceAbbreviation("MSH");
		src.setIsCurrent(true);
		atom.setSource(src);
		atom.setStatus('R');
		atom.setCode(Code.newCode("D000001"));		
		atom.setGenerated(true);
		atom.setReleased('N');
		atom.setSuppressible("N");
		atom.setTobereleased('Y');
		atom.setConcept(source);
		return atom;
	}
	
}