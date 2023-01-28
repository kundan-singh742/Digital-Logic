/*
 *  Kundan Singh Mahato 1001929223
 */
package code6_1001929223;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;

public class Password extends JFrame
{
    private final JPasswordField passwordField;
    private String userPassword;
    private final String actualPassword;
    
    public Password(String passwords)
    {
        super("Enter the password to continue...");
        passwordField = new JPasswordField(10);
        setLayout(new FlowLayout());

        actualPassword = passwords;
        passwordField.setEchoChar('X');
        add(passwordField);
        
        EventHandler handler = new EventHandler();
        passwordField.addActionListener(handler);
        
    }

    private class EventHandler implements ActionListener
    {
        @Override
        public void actionPerformed(ActionEvent event)
        {
            String string = "Password is incorrect. Try again.";
        
            if(event.getSource() == passwordField)
            {
                userPassword = String.format("%s",event.getActionCommand());

                if(userPassword.equals(actualPassword))
                {
                    passwordField.setVisible(false);
   
                    GameFrame gameFrame = new GameFrame();
                    gameFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    gameFrame.setSize(700,600);
                    gameFrame.setVisible(true);
                }
                else
                {
                    JOptionPane.showMessageDialog(null, string);
                }
            }
        }
    }  
}
