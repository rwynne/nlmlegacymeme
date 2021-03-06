/*****************************************************************************
 *
 * Package:    com.lexical.meme.core
 * Object:     FactFilter.java
 * 
 * Author:     Brian Carlsen
 *
 *****************************************************************************/
package gov.nih.nlm.recipe;

import java.io.Serializable;

/**
 * This class contains all of the information to describe
 * a filter for facts generated by matching or some other process;
 *
 * @author Brian A. Carlsen
 * @version 1.0
 *
 */
public class FieldInfo implements Serializable {

  private String name = "";
  private Object value = null; 

  /**
   * Constructor
   */
  public FieldInfo (String nm, Object val, boolean prim) { 
    name = nm;
    value = val;

  };

  public FieldInfo () { 
  };

  public Object getValue() {
    return value;
  };

  public String getName() {
    return name;
  };

  public void setValue(Object o) {
    value = o;
  };

  public void setName(String n) {
    name = n;
  };

}
