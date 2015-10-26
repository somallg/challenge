/*     */ import java.applet.Applet;
/*     */ import java.awt.Button;
/*     */ import java.awt.Color;
/*     */ import java.awt.Event;
/*     */ import java.awt.Graphics;
/*     */ import java.awt.Label;
/*     */ import java.awt.TextField;
/*     */ import java.math.BigInteger;
/*     */ import java.security.MessageDigest;
/*     */ import java.security.NoSuchAlgorithmException;
/*     */ import java.util.regex.Pattern;
/*     */ 
/*     */ public class applet4 extends Applet
/*     */ {
/*     */   private static final long serialVersionUID = 31337L;
/*     */   static final String CHECK_SUM = "129946388659050031";
/*     */   static final String ERROR_1 = "Error - Invalid Authorization Code Length!";
/*     */   static final String ERROR_2 = "Error - Invalid Authorization Code!";
/*     */   static final String ERROR_3 = "Error - Invalid Password Length!";
/*     */   static final String ERROR_4 = "Error - Unknown!";
/*     */   static final String ERROR_5 = "Error - Incorrect Password, Exiting...";
/*     */   static final String SUCCESS = "Correct! Use the AuthKey as the mission password!";
/*     */   static final String PHASH = "a8549033af1cda11ab2360d93ebc8764";
/*     */   static final String NHASH = "fce0dfbaafd8198a734cd368b3ea4f5e";
/*     */   Button okButton;
/*     */   TextField passField;
/*     */   TextField authField;
/*     */   Label label;
/*     */   Label lbAuth;
/*     */   Label lbPass;
/*  38 */   Color GlobColor = Color.LIGHT_GRAY;
/*     */ 
/*     */   public void paint(Graphics g)
/*     */   {
/*  45 */     g.setColor(this.GlobColor);
/*  46 */     g.fillRect(0, 0, 1000, 1000);
/*     */   }
/*     */ 
/*     */   public void init()
/*     */   {
/*  53 */     setLayout(null);
/*     */ 
/*  56 */     this.passField = new TextField("", 35);
/*  57 */     this.authField = new TextField("0000-0000-0000-0000-0000-0000", 35);
/*     */ 
/*  60 */     this.okButton = new Button("Authorize");
/*     */ 
/*  63 */     this.label = new Label("Please authorize yourself...");
/*  64 */     this.lbPass = new Label("Password :-");
/*  65 */     this.lbAuth = new Label("Authorization Code :- ");
/*     */ 
/*  68 */     this.passField.setBounds(170, 100, 300, 20);
/*  69 */     this.authField.setBounds(170, 130, 300, 20);
/*     */ 
/*  72 */     this.okButton.setBounds(200, 200, 100, 20);
/*     */ 
/*  75 */     this.label.setBounds(10, 250, 400, 100);
/*  76 */     this.label.setBackground(this.GlobColor);
/*  77 */     this.label.setAlignment(0);
/*     */ 
/*  80 */     this.lbAuth.setBounds(10, 130, 150, 20);
/*  81 */     this.lbAuth.setBackground(this.GlobColor);
/*  82 */     this.lbAuth.setAlignment(0);
/*     */ 
/*  85 */     this.lbPass.setBounds(10, 100, 150, 20);
/*  86 */     this.lbPass.setBackground(this.GlobColor);
/*  87 */     this.lbPass.setAlignment(0);
/*     */ 
/*  90 */     add(this.okButton);
/*  91 */     add(this.passField);
/*  92 */     add(this.authField);
/*  93 */     add(this.lbPass);
/*  94 */     add(this.lbAuth);
/*  95 */     add(this.label);
/*     */   }
/*     */ 
/*     */   public boolean action(Event evt, Object arg)
/*     */   {
/* 102 */     if ((evt.target instanceof Button))
/* 103 */       HandleButtons(arg);
/* 104 */     return true;
/*     */   }
/*     */ 
/*     */   public void HandleButtons(Object labelTemp)
/*     */   {
/* 115 */     if (labelTemp.toString() == "Authorize")
/*     */     {
/* 117 */       String pwd = this.passField.getText();
/* 118 */       String auth = this.authField.getText();
/*     */ 
/* 122 */       if ((auth.length() > 35) || (auth.length() <= 0))
/*     */       {
/* 124 */         this.label.setText("Error - Invalid Authorization Code Length!");
/* 125 */         System.exit(0);
/*     */       }
/*     */ 
/* 132 */       if (pwd.length() != 8) {
/* 133 */         this.label.setText("Error - Invalid Password Length!");
/* 134 */         System.exit(0);
/*     */       }
/*     */       else {
/* 137 */         String temp = hash(pwd);
/*     */ 
/* 141 */         if (!temp.equals("a8549033af1cda11ab2360d93ebc8764")) {
/* 142 */           this.label.setText("Error - Incorrect Password, Exiting...");
/* 143 */           System.exit(0);
/*     */         }
/*     */ 
/* 146 */         String code = genAuthKey(auth);
/* 147 */         String key = genPassKey(pwd);
/*     */ 
/* 152 */         if (Long.parseLong(code) <= 0L)
/*     */         {
/* 154 */           this.label.setText("Authorization Check Failed. Exiting...");
/* 155 */           System.exit(0);
/*     */         }
/*     */         else {
/* 158 */           long cKey = Long.parseLong(code);
/* 159 */           long lng = Long.parseLong("" + pwd.length() + 2) * 8679L;
/* 160 */           String aHash = hash(auth);
/* 161 */           cKey *= lng;
/* 162 */           cKey += Long.parseLong(key);
/* 163 */           long tKey = Long.parseLong("129946388659050031");
/*     */ 
/* 165 */           if ("fce0dfbaafd8198a734cd368b3ea4f5e".equals(aHash))
/* 166 */             if (cKey == tKey) {
/* 167 */               this.label.setText("Correct! Use the AuthKey as the mission password!");
/* 168 */             } else if (cKey != tKey) {
/* 169 */               this.label.setText("Error - Invalid Authorization Code!");
/*     */             } else {
/* 171 */               this.label.setText("Error - Unknown!");
/* 172 */               destroy();
/*     */             }
/*     */         }
/*     */       }
/*     */     }
/*     */   }
/*     */ 
/*     */   protected static String genAuthKey(String authCode)
/*     */   {
/* 192 */     String[] authArr = Pattern.compile("-").split(authCode);
/* 193 */     String auth1 = authArr[0];
/* 194 */     String auth2 = authArr[1];
/* 195 */     String auth3 = authArr[2];
/* 196 */     String auth4 = authArr[3];
/* 197 */     String auth5 = authArr[4];
/* 198 */     String auth6 = authArr[5];
/*     */ 
/* 200 */     char a = authArr[0].charAt(0);
/* 201 */     char b = authArr[1].charAt(0);
/* 202 */     char c = authArr[2].charAt(1);
/* 203 */     char d = authArr[3].charAt(3);
/* 204 */     char e = authArr[4].charAt(0);
/* 205 */     char f = authArr[5].charAt(2);
/*     */ 
/* 209 */     char a2 = authArr[0].charAt(1);
/* 210 */     char b2 = authArr[1].charAt(2);
/* 211 */     char c2 = authArr[2].charAt(0);
/* 212 */     char d2 = authArr[3].charAt(1);
/* 213 */     char e2 = authArr[4].charAt(2);
/* 214 */     char f2 = authArr[5].charAt(0);
/*     */ 
/* 216 */     long mod1 = authArr[3].charAt(0);
/* 217 */     long mod2 = authArr[3].charAt(2);
/* 218 */     long mod3 = authArr[4].charAt(1);
/* 219 */     long mod4 = authArr[4].charAt(3);
/* 220 */     long mod5 = authArr[5].charAt(1);
/* 221 */     long mod6 = authArr[5].charAt(3);
/*     */ 
/* 223 */     if ((a != '8') || (b != '4') || (c != '8') || (d != '2') || (e != '8') || (f != '2'))
/*     */     {
/* 225 */       return "0";
/*     */     }
/* 227 */     if ((a2 == '5') && (b2 == '5') && (c2 == '4') && (d2 == '1') && (e2 == '3') && (f2 == '2') && (mod1 == 57L) && (mod2 == 55L) && (mod3 == 54L) && (mod4 == 52L) && (mod5 == 51L) && (mod6 == 51L)) {
/* 228 */       Long aCode = Long.valueOf(Long.parseLong(auth1) * Long.parseLong(auth2) * Long.parseLong(auth3) - Long.parseLong(auth4) - Long.parseLong(auth5) + Long.parseLong(auth6));
/* 229 */       String code = "" + aCode;
/* 230 */       return code;
/*     */     }
/* 232 */     return "0";
/*     */   }
/*     */ 
/*     */   protected static String genPassKey(String pwd)
/*     */   {
/* 243 */     long y = 0L;
/* 244 */     int x = 0;
/*     */ 
/* 247 */     while (x < pwd.length()) {
/* 248 */       char c = pwd.charAt(x);
/* 249 */       int tmp = c;
/* 250 */       y += tmp;
/* 251 */       y *= x;
/* 252 */       x++;
/*     */     }
/*     */ 
/* 255 */     String pKey = "" + y;
/*     */ 
/* 257 */     return pKey;
/*     */   }
/*     */ 
/*     */   public static String hash(String s)
/*     */   {
/* 263 */     String tmp = "";
/*     */     try
/*     */     {
/* 266 */       MessageDigest m = MessageDigest.getInstance("MD5");
/* 267 */       m.update(s.getBytes(), 0, s.length());
/* 268 */       tmp = new BigInteger(1, m.digest()).toString(16);
/*     */     }
/*     */     catch (NoSuchAlgorithmException nfeRef)
/*     */     {
/*     */     }
/*     */ 
/* 275 */     while (tmp.length() < 32) {
/* 276 */       tmp = "0" + tmp;
/*     */     }
/*     */ 
/* 279 */     return tmp;
/*     */   }
/*     */ }

/* Location:           D:\jd-gui-0.3.4.windows\
 * Qualified Name:     applet4
 * JD-Core Version:    0.6.1
 */