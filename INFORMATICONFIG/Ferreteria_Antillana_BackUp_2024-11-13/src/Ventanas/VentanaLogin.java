package Ventanas;

import java.awt.Image;
import java.awt.Toolkit;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import conexiones.Conexiones;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;


public class VentanaLogin extends javax.swing.JFrame {

    /**
     * Creates new form VentanaLogin
     */
    public VentanaLogin() {
        initComponents();
        Image icono = Toolkit.getDefaultToolkit().getImage(getClass().getResource("/imagenes/icono.png"));
        setIconImage(icono);
        setLocationRelativeTo(null);    //--> Esta instrucción es para que la ventana aparezca en el centro de la pantalla
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        l_logo = new javax.swing.JLabel();
        l_pass = new javax.swing.JLabel();
        l_usuario = new javax.swing.JLabel();
        campo_usuario = new javax.swing.JTextField();
        campo_pass = new javax.swing.JPasswordField();
        jLabel1 = new javax.swing.JLabel();
        b_acceder = new javax.swing.JButton();
        b_Salir = new javax.swing.JButton();
        l_fondo = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("LOGIN DE USUARIO");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        l_logo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/logo.png"))); // NOI18N
        getContentPane().add(l_logo, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 10, 230, 240));

        l_pass.setFont(new java.awt.Font("Liberation Sans", 0, 18)); // NOI18N
        l_pass.setForeground(new java.awt.Color(0, 0, 0));
        l_pass.setText("Ingrese contraseña");
        getContentPane().add(l_pass, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 360, -1, -1));

        l_usuario.setFont(new java.awt.Font("Liberation Sans", 0, 18)); // NOI18N
        l_usuario.setForeground(new java.awt.Color(0, 0, 0));
        l_usuario.setText("Ingrese usuario");
        getContentPane().add(l_usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 280, -1, -1));

        campo_usuario.setBackground(new java.awt.Color(255, 255, 255));
        campo_usuario.setFont(new java.awt.Font("Arial", 1, 15)); // NOI18N
        campo_usuario.setForeground(new java.awt.Color(0, 102, 102));
        getContentPane().add(campo_usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 310, 240, 30));

        campo_pass.setBackground(new java.awt.Color(255, 255, 255));
        campo_pass.setFont(new java.awt.Font("Arial", 1, 15)); // NOI18N
        campo_pass.setForeground(new java.awt.Color(0, 102, 102));
        getContentPane().add(campo_pass, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 390, 240, 30));

        jLabel1.setFont(new java.awt.Font("Karumbi", 1, 36)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(0, 0, 0));
        jLabel1.setText("Willy SoluSystem ©");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 540, 240, 30));

        b_acceder.setBackground(new java.awt.Color(51, 153, 0));
        b_acceder.setFont(new java.awt.Font("DejaVu Sans", 0, 22)); // NOI18N
        b_acceder.setText("Acceder");
        b_acceder.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                b_accederActionPerformed(evt);
            }
        });
        getContentPane().add(b_acceder, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 450, 130, 50));

        b_Salir.setBackground(new java.awt.Color(51, 153, 0));
        b_Salir.setFont(new java.awt.Font("DejaVu Sans", 0, 22)); // NOI18N
        b_Salir.setText("Salir");
        b_Salir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                b_SalirActionPerformed(evt);
            }
        });
        getContentPane().add(b_Salir, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 450, 130, 50));

        l_fondo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/fondo_login.jpg"))); // NOI18N
        getContentPane().add(l_fondo, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 401, 588));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    int intentos = 0;
    private void b_accederActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_b_accederActionPerformed
        Connection conexion = Conexiones.conectar();
        String usuario = campo_usuario.getText();
        String clave = new String(campo_pass.getPassword());
        PreparedStatement consulta;
        ResultSet resultado;
        int control = 0;
        try{
            String sql = "select * from usuarios where nombre_usuario = ? and clave = ?";
            consulta = conexion.prepareStatement(sql);
            consulta.setString(1, usuario);
            consulta.setString(2, clave);
            resultado = consulta.executeQuery();
            
            //--- Controlar cuando presiona botón Acceder con los campos en blanco:
            if(campo_usuario.getText().isEmpty() || new String(campo_pass.getPassword()).isEmpty()){
                JOptionPane.showMessageDialog(null, "NO DEBE HABER CAMPOS VACÍOS",
                                                "ERROR",
                                                JOptionPane.ERROR_MESSAGE  );
                
                return;         //---> Este return es para que no salte el mensaje de "Intente de Nuevo"
            }
                        
            //--- Controlar cuando Usuario y/o contraseña son INCORRECTOS
            if(resultado.next()){
                JOptionPane.showMessageDialog(null, "LOGIN CORRECTO", "LOGIN",
                        JOptionPane.INFORMATION_MESSAGE);
            }else{
                intentos++;
                JOptionPane.showMessageDialog(null, "USUARIO / CONTRASEÑA INCORRECTOS\n"
                                + "INTENTE DE NUEVO.. ", "ERROR",
                                JOptionPane.ERROR_MESSAGE);
                
                campo_usuario.setText("");      //--> Para limpiar el campo Usuario
                campo_pass.setText("");         //--> Para limpiar el campo Pass
            }
            
            if(intentos == 3){
                JOptionPane.showMessageDialog(null,
                                              "CANTIDAD DE INTENTOS AGOTADA\n"
                                    + " SU CUENTA HA SIDO BLOQUEADA\n   "
                                    + " CONTACTE A SOPORTE",
                                              "AVISO",
                                              JOptionPane.WARNING_MESSAGE);
            }
            
        }catch(Exception e){
            
        }
    }//GEN-LAST:event_b_accederActionPerformed

    private void b_SalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_b_SalirActionPerformed
        int respuesta = JOptionPane.showConfirmDialog(null,
                                "¿CONFIRMA SALIR DE LA APLICACIÓN?",
                                "CONFIRMAR SALIDA",
                                JOptionPane.YES_NO_OPTION,
                                JOptionPane.QUESTION_MESSAGE);
        
        if(respuesta == JOptionPane.YES_OPTION){
            System.exit(0);
        }
    }//GEN-LAST:event_b_SalirActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(VentanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(VentanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(VentanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(VentanaLogin.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new VentanaLogin().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton b_Salir;
    private javax.swing.JButton b_acceder;
    private javax.swing.JPasswordField campo_pass;
    private javax.swing.JTextField campo_usuario;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel l_fondo;
    private javax.swing.JLabel l_logo;
    private javax.swing.JLabel l_pass;
    private javax.swing.JLabel l_usuario;
    // End of variables declaration//GEN-END:variables
}
