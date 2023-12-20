package sodaCLIPS;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.BreakIterator;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.Iterator;

import javax.swing.*;
import javax.swing.SwingUtilities;
 
import CLIPSJNI.*;
import CLIPSJNI.MultifieldValue;
import CLIPSJNI.PrimitiveValue;
import CLIPSJNI.SymbolValue;

public class SodaDecisionApp implements ActionListener {
   JLabel displayLabel;
   JButton nextButton;
   JButton prevButton;
   JPanel choicesPanel;
   ButtonGroup choicesButtons;
   ResourceBundle resources;
   String relationAsserted;
   String lastRelationAsserted="";
   Environment clips;
   boolean isExecuting = false;
   Thread executionThread;
      
   SodaDecisionApp(){
	      try
	        {
	    	  resources = ResourceBundle.getBundle("resources.soda");
	        }
	      catch (MissingResourceException mre)
	        {
	         mre.printStackTrace();
	         return;
	        }
	      JFrame jfrm = new JFrame(resources.getString("Title"));  
	        
	      jfrm.getContentPane().setLayout(new GridLayout(3,1));  
	     
	      jfrm.setSize(700,400);  

	      jfrm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);  

	      JPanel displayPanel = new JPanel(); 
	      displayLabel = new JLabel();
	      displayPanel.add(displayLabel);
	      
	      choicesPanel = new JPanel(); 
	      choicesButtons = new ButtonGroup();

	      JPanel buttonPanel = new JPanel(); 
	      
	      prevButton = new JButton("Previous");
	      prevButton.setActionCommand("Prev");
	      buttonPanel.add(prevButton);
	      prevButton.addActionListener(this);
	      
	      nextButton = new JButton("Next");
	      nextButton.setActionCommand("Next");
	      buttonPanel.add(nextButton);
	      nextButton.addActionListener(this);
	     
	      jfrm.getContentPane().add(displayPanel); 
	      jfrm.getContentPane().add(choicesPanel); 
	      jfrm.getContentPane().add(buttonPanel);
	      
	      clips = new Environment();
	      
	      clips.load("soda.clp");
	      

	      
	      clips.reset();
	      
	      jfrm.setVisible(true);  
	      try {
			nextUIState();
			} catch (Exception e) {
				e.printStackTrace();
			}
   }
   
   private void nextUIState() throws Exception  {
		String evalStr = "(find-all-facts ((?f UI-state)) TRUE)";
		
	      
		MultifieldValue pv = (MultifieldValue) clips.eval(evalStr);
	      
		int tNum = pv.size();
	      
	  if (tNum == 0) {System.out.println("Nie ma wiecej UI");return;}
	
	  FactAddressValue fv = (FactAddressValue) pv.get(0);
	  
	  relationAsserted = fv.getFactSlot("relation-asserted").toString();
	 
	  //Check if there is no change in the UI
	  if (relationAsserted.contentEquals(lastRelationAsserted)) 
	  {
		  	clips.run(1);
		  	nextUIState();
		  	return;
	  }
	  
	  lastRelationAsserted = relationAsserted;
	  
	  /*========================================*/
	  /*    Determine the Next button states.   */
	  /*========================================*/
	  
	  if (fv.getFactSlot("state").toString().equals("final"))
	{ 
	 nextButton.setActionCommand("Restart");
	 nextButton.setText(resources.getString("Restart")); 
	    }
	  else if (fv.getFactSlot("state").toString().equals("initial"))
	{
	 nextButton.setActionCommand("Next");
	 nextButton.setText(resources.getString("Next"));
	    }
	  else
	    { 
	     nextButton.setActionCommand("Next");
	 nextButton.setText(resources.getString("Next"));
	    }
	  
	  /*=====================*/
	  /* Set up the choices. */
	  /*=====================*/
	  
	  choicesPanel.removeAll();
	  choicesButtons = new ButtonGroup();
	        
	  pv = (MultifieldValue) fv.getFactSlot("valid-answers");
	  
	  //List theList =  pv.multifieldValue();
	  
	  String selected = fv.getFactSlot("response").toString();
	 
	  for (int i =0;i<pv.size();i++)//Iterator itr = theList.iterator(); itr.hasNext();) 
	    {
	     PrimitiveValue bv = (PrimitiveValue) pv.get(i);
	     JRadioButton rButton;
	                    
	     if (bv.toString().equals(selected))
	        { rButton = new JRadioButton(resources.getString(bv.toString()),true); }
	     else
	        { rButton = new JRadioButton(resources.getString(bv.toString()),false); }
	                 
	     rButton.setActionCommand(bv.toString());
	     choicesPanel.add(rButton);
	     choicesButtons.add(rButton);
	    }
	    
	  choicesPanel.repaint();
	  
	  /*====================================*/
	  /* Set the label to the display text. */
	  /*====================================*/
	
	  String theText = resources.getString(((SymbolValue) fv.getFactSlot("display")).symbolValue());
	        
	  wrapLabelText(displayLabel,theText);
	  
	} 

	@Override
	public void actionPerformed(ActionEvent event) {
	      /*=========================*/
	      /* Handle the Next button. */
	      /*=========================*/
	      
	      if (event.getActionCommand().equals("Next"))
	      {
	    	  if (choicesButtons.getButtonCount() != 0)
	          {
	    		  clips.assertString("(" +relationAsserted+" "+choicesButtons.getSelection().getActionCommand()+")");
	    		  System.out.println("(" +relationAsserted+" "+choicesButtons.getSelection().getActionCommand()+")");
	          }
	    	  else
	    	  {
	    		  clips.assertString( "(start)" );
	    	  }
	           
	    	  clips.run(1);
	    	  try {
	    	  	nextUIState();
	    	  }catch(Exception e) {
	    		  e.printStackTrace();
	    	  }
	       }
	       else if (event.getActionCommand().equals("Restart"))
	       { 
	         clips.reset(); 
	         clips.run(1);
	         try {
	    	  	nextUIState();
	    	  }catch(Exception e) {
	    		  e.printStackTrace();
	    	  }
	       }
	     }
	     
		
	
	   /*public void runApp()
	     {
	      Runnable runThread = 
	         new Runnable()
	           {
	            public void run()
	              {
	               clips.run();
	               
	               SwingUtilities.invokeLater(
	                  new Runnable()
	                    {
	                     public void run()
	                       {
	                        try 
	                          { nextUIState(); }
	                        catch (Exception e)
	                          { e.printStackTrace(); }
	                       }
	                    });
	              }
	           };
	      
	      isExecuting = true;
	      
	      executionThread = new Thread(runThread);
	      
	      executionThread.start();
	     }
*/
	
	/* public void onActionPerformed(ActionEvent ae) throws Exception 
     { 
      if (isExecuting) return;

      String evalStr = "(find-all-facts ((?f state-list)) TRUE)";
      
      String currentID = clips.eval(evalStr).get(0).getFactSlot("current").toString();
      
      if (ae.getActionCommand().equals("Next"))
        {
         if (choicesButtons.getButtonCount() == 0)
           { clips.assertString("(next " + currentID + ")"); }
         else
           {
            clips.assertString("(next " + currentID + " " +
                               choicesButtons.getSelection().getActionCommand() + 
                               ")");
           }
           
         runApp();
        }
      else if (ae.getActionCommand().equals("Restart"))
        { 
         clips.reset(); 
         runApp();
        }
      else if (ae.getActionCommand().equals("Prev"))
        {
         clips.assertString("(prev " + currentID + ")");
         runApp();
        }
     }*/

	 private void wrapLabelText(
		     JLabel label, 
		     String text) 
		     {
		      FontMetrics fm = label.getFontMetrics(label.getFont());
		      Container container = label.getParent();
		      int containerWidth = container.getWidth();
		      int textWidth = SwingUtilities.computeStringWidth(fm,text);
		      int desiredWidth;

		      if (textWidth <= containerWidth)
		        { desiredWidth = containerWidth; }
		      else
		        { 
		         int lines = (int) ((textWidth + containerWidth) / containerWidth);
		                  
		         desiredWidth = (int) (textWidth / lines);
		        }
		                 
		      BreakIterator boundary = BreakIterator.getWordInstance();
		      boundary.setText(text);
		   
		      StringBuffer trial = new StringBuffer();
		      StringBuffer real = new StringBuffer("<html><center>");
		   
		      int start = boundary.first();
		      for (int end = boundary.next(); end != BreakIterator.DONE;
		           start = end, end = boundary.next())
		        {
		         String word = text.substring(start,end);
		         trial.append(word);
		         int trialWidth = SwingUtilities.computeStringWidth(fm,trial.toString());
		         if (trialWidth > containerWidth) 
		           {
		            trial = new StringBuffer(word);
		            real.append("<br>");
		            real.append(word);
		           }
		         else if (trialWidth > desiredWidth)
		           {
		            trial = new StringBuffer("");
		            real.append(word);
		            real.append("<br>");
		           }
		         else
		           { real.append(word); }
		        }
		   
		      real.append("</html>");
		   
		      label.setText(real.toString());
		     }

   public static void main(String args[])
     {  
      // Create the frame on the event dispatching thread.  
      SwingUtilities.invokeLater(
        new Runnable() 
          {  
           public void run() { new SodaDecisionApp(); }  
          });   
     }

}
