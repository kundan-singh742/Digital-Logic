/*
 *  Kundan Singh Mahato 1001929223
 */
package code6_1001929223;

import java.awt.event.ActionListener;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.util.Random;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class GameFrame extends JFrame
{
    private final JLabel label1;
    private final JButton OKButton;
    private final JButton CancelButton;
    private final JTextField textField1;
    private String CCName;
    
    public GameFrame()
    {
        super("Welcome to my Guessing Game");
        setLayout(new FlowLayout()); 
        //GameFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        Random rn = new Random();
        int option;
        option = rn.nextInt(4);
        
        Icon CC = null;
    
        switch(option)
        {
            case 0:
                CCName = "dopey";
                CC = new ImageIcon(getClass().getResource(CCName + ".jpg"));
                break;
            
            case 1:
                CCName = "grumpy";
                CC = new ImageIcon(getClass().getResource(CCName + ".jpg"));
                break;
            
            case 2:
                CCName = "sleepy";
                CC = new ImageIcon(getClass().getResource(CCName + ".jpg"));
                break;
            
            case 3:
                CCName = "happy";
                CC = new ImageIcon(getClass().getResource(CCName + ".jpg"));
                break;
            
            default:
                System.out.println("There is some error in the program. Fix it.");   
        }
        
        label1 = new JLabel();
        label1.setIcon(CC);
        label1.setText("What is the cartoon character's name?");
        label1.setHorizontalTextPosition(SwingConstants.CENTER);
        label1.setVerticalTextPosition(SwingConstants.BOTTOM);
        label1.setToolTipText("Popular Charaters from Snow White and Seven Dwarfs.");
        add(label1);
        
        EventHandler handler = new EventHandler();
        
        textField1 = new JTextField("Enter your text here...",15);
        textField1.selectAll();
        textField1.addActionListener(handler);
        add(textField1);
        
        OKButton = new JButton("OK");
        OKButton.addActionListener(handler);
        OKButton.setRolloverIcon(CC);
        add(OKButton);
        
        CancelButton = new JButton("Cancel");
        CancelButton.addActionListener(handler);
        //CancelButton.addActionListener(event->System.exit(0));
        //CancelButton.addActionListener(event->onQuitClick());
        CancelButton.setRolloverIcon(CC);
        add(CancelButton);
    }  
    
     private class EventHandler implements ActionListener
    {

        @Override
        public void actionPerformed(ActionEvent event)
        {
            String userinput = "";
            
            if(event.getSource() == textField1||event.getSource()==OKButton)
            {
                userinput = textField1.getText();
                String showMessage;
                
                boolean match = false;
                
                if(userinput.equalsIgnoreCase(CCName))
                {
                    showMessage = "Congratulation!! You won the game.";
                    match = true;
                }
                else
                {
                    showMessage = "Unfortunately, Your answer is incorrect. Please try again";
                }
                
                if(event.getSource() == OKButton || event.getSource() == textField1)
                {
                    JOptionPane.showMessageDialog(null,showMessage);
                    
                    if(match == true)
                    {
                        System.exit(0);
                    }
                }
                
            }
            else if(event.getSource() == CancelButton)
            {
                System.exit(0);
            }
        }
    }
}
