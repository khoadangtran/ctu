import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import PrintTable.DBTablePrinter;
import java.util.Scanner;

public class MySQLConnect {
    
    static Connection conn = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    static CallableStatement cStmt = null;
    
    public static void main(String args[]) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            String connStr = "jdbc:mysql://localhost:3307/qltro?user=root";
            
            conn = DriverManager.getConnection(connStr);
            
            System.out.println("Noi ket thanh cong");
            
        } catch (Exception ex) { //xử lý ngoại lệ nếu có
            System.out.println("Noi ket khong thanh cong" + ex.getMessage());
            //ex.printStackTrace();
        }
        
        init();
        //mainMenu();
        //nhapPT();
        //setDaDong();
        //upDienNuoc();
        //tongDoanhThu();
        //doanhThuThang();
        //upGiaDV();   
        //addHDong();
        //upHDong();
        //empty();
        //tongDien();
        //tongNuoc();
        //khachNo();
        //search();
        //inputKhach();
        //inputPhong();
        //xoaKhach();
}   
    
    public static void init(){
        System.out.println();
        System.out.println("\t\t\t\t\t\t\t+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+");
        System.out.println("\t\t\t\t\t\t\t|                                                              |");
        System.out.println("\t\t\t\t\t\t\t|                        QUAN LI NHA TRO                       |");
        System.out.println("\t\t\t\t\t\t\t|                                                              |");
        System.out.println("\t\t\t\t\t\t\t+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+");
        System.out.println("\t\t\t\t\t\t\t|                                                              |");
        System.out.println("\t\t\t\t\t\t\t|         +=============+                +=============+       |");
        System.out.println("\t\t\t\t\t\t\t|     1:  |   Dang ky   |            2:  |  Dang nhap  |       |");
        System.out.println("\t\t\t\t\t\t\t|         +=============+                +=============+       |");
        System.out.println("\t\t\t\t\t\t\t|                                                              |");
        System.out.println("\t\t\t\t\t\t\t|                                                              |");
        System.out.println("\t\t\t\t\t\t\t|                       +=============+                        |");
        System.out.println("\t\t\t\t\t\t\t|                  X:   |    Thoat    |                        |");
        System.out.println("\t\t\t\t\t\t\t|                       +=============+                        |");
        System.out.println("\t\t\t\t\t\t\t|                                                              |");
        System.out.println("\t\t\t\t\t\t\t+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+");
       
        System.out.print("\n >>> ");
        Scanner sc = new Scanner(System.in);
        char x = sc.nextLine().charAt(0);
        
        switch(x){
            case '1':
                dangKy();
                init();
                break;
            case '2': 
                while (dangNhap() != true) init();
                break;
            case 'x','X':
                System.out.println("====================================================== Ket thuc chuong trinh ... ======================================================");
                System.exit(0);
                break;
            default:
                System.out.print("Lua chon khong phu hop.");
        }
    }
    
    public static void mainMenu(){
        System.out.println();
        System.out.println("\t\t\t\t\t\t\t+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|                          QUAN LI NHA TRO                         |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|          +===============+              +===============+        |");
        System.out.println("\t\t\t\t\t\t\t|      T:  |   TAI KHOAN   |          H:  |   HOP DONG    |        |");
        System.out.println("\t\t\t\t\t\t\t|          +===============+              +===============+        |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|          +===============+              +===============+        |");
        System.out.println("\t\t\t\t\t\t\t|      P:  |   PHONG TRO   |          C:  |   CHI TIEU    |        |");
        System.out.println("\t\t\t\t\t\t\t|          +===============+              +===============+        |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|          +===============+              +===============+        |");
        System.out.println("\t\t\t\t\t\t\t|      K:  |   KHACH TRO   |          D:  |   DOANH THU   |        |");
        System.out.println("\t\t\t\t\t\t\t|          +===============+              +===============+        |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t|                         +===============+                        |");
        System.out.println("\t\t\t\t\t\t\t|                     X:  |     THOAT     |                        |");
        System.out.println("\t\t\t\t\t\t\t|                         +===============+                        |");
        System.out.println("\t\t\t\t\t\t\t|                                                                  |");
        System.out.println("\t\t\t\t\t\t\t+ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+");
        
        System.out.print("\n >>> ");
        Scanner sc = new Scanner(System.in);
        char x = sc.nextLine().charAt(0);
        
        switch(x){
            case 't','T':
                subMenu('T');
                break;
            case 'p','P': 
                subMenu('P');
                break;
            case 'k','K':
                subMenu('K');
                break;
            case 'h','H':
                subMenu('H');
                break;
            case 'c','C':
                subMenu('C');
                break;
            case 'd','D':
                subMenu('D');
                break;
            case 'x','X':
                System.out.println("====================================================== Ket thuc chuong trinh ... ======================================================");
                System.exit(0);
                break;
            default:
                System.out.print("Lua chon khong phu hop.");
                break;
        }
    }
    
    public static void subMenu(char c){
        if (c=='T'){
            System.out.println();
            System.out.println("\t\t\t\t\t\t\t+============= TAI KHOAN ============+");
            System.out.println("\t\t\t\t\t\t\t|                                    |");
            System.out.println("\t\t\t\t\t\t\t|         1. Xem DS tai khoan        |");
            System.out.println("\t\t\t\t\t\t\t|                                    |");
            System.out.println("\t\t\t\t\t\t\t+====================================+");
            System.out.println("\t\t\t\t\t\t\t                           B: Tro ve");
            
            System.out.print("\n>>> ");
            Scanner sc = new Scanner(System.in);
            char x = sc.nextLine().charAt(0);
            
            
            switch(x){
                case '1':
                    dSTaiKhoan();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('T');
                    break;
                case 'b','B':
                    mainMenu();
                    break;
                default:
                    System.out.print("Lua chon khong phu hop!");
                    subMenu('T');
                    break;
            }
        }
        
        else if (c=='P'){
            System.out.println("\t\t\t\t\t\t\t+============= PHONG TRO =============+");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t|        1. Xem DS phong tro          |");
            System.out.println("\t\t\t\t\t\t\t|        2. Tra cuu phong trong       |");
            System.out.println("\t\t\t\t\t\t\t|        3. Nhap phong moi            |");
            System.out.println("\t\t\t\t\t\t\t|        4. Cap nhat dien nuoc        |");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t+=====================================+");
            System.out.println("\t\t\t\t\t\t\t                             B: Tro ve");
           
            System.out.print("\n>>> ");
            Scanner sc = new Scanner(System.in);
            char x = sc.nextLine().charAt(0);
            
            
            switch(x){
                case '1':
                    dSPhong();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('P');
                    break;
                case '2':
                    emptyRoom();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('P');
                    break;
                case '3':
                    inputPhong();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('P');
                    break;
                case '4':
                    upDienNuoc();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('P');
                    break;
                case 'b','B':
                    mainMenu();
                    break;
                default:
                    System.out.print("Lua chon khong phu hop!");
                    subMenu('P');
                    break;
            }
        }
        else if (c=='K'){
            System.out.println("\t\t\t\t\t\t\t+============= KHACH TRO =============+");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t|       1. Xem DS khach tro           |");
            System.out.println("\t\t\t\t\t\t\t|       2. Tra cuu khach dang no      |");
            System.out.println("\t\t\t\t\t\t\t|       3. Danh dau khach da dong     |");
            System.out.println("\t\t\t\t\t\t\t|       4. Tim khach tro              |");
            System.out.println("\t\t\t\t\t\t\t|       5. Them khach tro moi         |");
            System.out.println("\t\t\t\t\t\t\t|       6. Xoa khach tro              |");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t+=====================================+");
            System.out.println("\t\t\t\t\t\t\t                             B: Tro ve");
           
            System.out.print("\n>>> ");
            Scanner sc = new Scanner(System.in);
            char x = sc.nextLine().charAt(0);
            
            
            switch(x){
                case '1':
                    dSKhachTro();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('K');
                    break;
                case '2':
                    khachNo();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('K');
                    break;
                case '3':
                    setDaDong();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('K');
                    break;
                case '4':
                    search();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('K');
                    break;
                case '5':
                    inputKhach();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('K');
                    break;
                case '6':
                    xoaKhach();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('K');
                    break;
                case 'b','B':
                    mainMenu();
                    break;
                default:
                    System.out.print("Lua chon khong phu hop!");
                    subMenu('K');
                    break;
            }   
        }
        else if (c=='H'){
            System.out.println("\t\t\t\t\t\t\t+============== HOP DONG =============+");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t|        1. Xem DS hop dong           |");
            System.out.println("\t\t\t\t\t\t\t|        2. Cap nhat hop dong         |");
            System.out.println("\t\t\t\t\t\t\t|        3. Them hop dong moi         |");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t+=====================================+");
            System.out.println("\t\t\t\t\t\t\t                             B: Tro ve");
           
            System.out.print("\n>>> ");
            Scanner sc = new Scanner(System.in);
            char x = sc.nextLine().charAt(0);
            
            
            switch(x){
                case '1':
                    dSHDong();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('H');
                    break;
                case '2':
                    upHDong();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('H');
                    break;
                case '3':
                    addHDong();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('H');
                    break;
                case 'b','B':
                    mainMenu();
                    break;
                default:
                    System.out.print("Lua chon khong phu hop!");
                    subMenu('H');
                    break;
            }
        }
        else if (c=='C'){
            System.out.println("\t\t\t\t\t\t\t+============== CHI TIEU =============+");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t|        1. Xem gia dich vu           |");
            System.out.println("\t\t\t\t\t\t\t|        2. Cap nhat don gia          |");
            System.out.println("\t\t\t\t\t\t\t|        3. Tong dien tieu thu        |");
            System.out.println("\t\t\t\t\t\t\t|        4. Tong nuoc tieu thu        |");
            System.out.println("\t\t\t\t\t\t\t|                                     |");
            System.out.println("\t\t\t\t\t\t\t+=====================================+");
            System.out.println("\t\t\t\t\t\t\t                             B: Tro ve");
           
            System.out.print("\n>>> ");
            Scanner sc = new Scanner(System.in);
            char x = sc.nextLine().charAt(0);
            
            
            switch(x){
                case '1':
                    dSDV();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('C');
                    break;
                case '2':
                    upGiaDV();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('C');
                    break;
                case '3':
                    tongDien();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('C');
                    break;
                case '4':
                    tongNuoc();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('C');
                    break;
                case 'b','B':
                    mainMenu();
                    break;
                default:
                    System.out.print("Lua chon khong phu hop!");
                    subMenu('C');
                    break;
            }
        }
        else if (c=='D'){
            System.out.println("\t\t\t\t\t\t\t+============== DOANH THU =============+");
            System.out.println("\t\t\t\t\t\t\t|                                      |");
            System.out.println("\t\t\t\t\t\t\t|      1. Xem DS phieu thu             |");
            System.out.println("\t\t\t\t\t\t\t|      2. Nhap phieu thu               |");
            System.out.println("\t\t\t\t\t\t\t|      3. Xem tong doanh thu           |");
            System.out.println("\t\t\t\t\t\t\t|      4. Xem doanh thu theo thang     |");
            System.out.println("\t\t\t\t\t\t\t|                                      |");
            System.out.println("\t\t\t\t\t\t\t+======================================+");
            System.out.println("\t\t\t\t\t\t\t                             B: Tro ve");
           
            System.out.print("\n>>> ");
            Scanner sc = new Scanner(System.in);
            char x = sc.nextLine().charAt(0);
            
            
            switch(x){
                case '1':
                    dSPhieuThu();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('D');
                    break;
                case '2':
                    nhapPT();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('D');
                    break;
                case '3':
                    tongDoanhThu();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('D');
                    break;
                case '4':
                    doanhThuThang();
                    System.out.println("Press \"ENTER\" to return...");
                    sc.nextLine();
                    subMenu('D');
                    break;
                case 'b','B':
                    mainMenu();
                default:
                    System.out.print("Lua chon khong phu hop!");
                    subMenu('D');
                    break;
            }
        }
    }

    public static void dangKy(){
        ResultSet rs2 = null;
        try {
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call register(?,?,?,?,?,?)}");
            Scanner sc = new Scanner(System.in);
  
            System.out.print("\nNhap ten dang nhap: ");
            String tendnhap = sc.nextLine();
            rs2 = stmt.executeQuery("select * from tai_khoan where ten_dnhap = '"+ tendnhap + "'");

            while (rs2.next() && tendnhap.equals(rs2.getString(2))){
                System.out.println("Ten dang nhap da duoc su dung.");
                System.out.print("Nhap lai ten dang nhap: ");
                tendnhap = sc.nextLine();
                rs2 = stmt.executeQuery("select * from tai_khoan where ten_dnhap = '"+ tendnhap + "'");
            } 

            System.out.print("Nhap mat khau: ");
            String mkhau = sc.nextLine();

            System.out.print("Xac nhan mat khau: ");
            String xnmk = sc.nextLine();

            while (!xnmk.equals(mkhau)){
                System.out.print("Mat khau khong trung khop.");
                System.out.print("Nhap lai mat khau xac nhan: ");
                xnmk = sc.nextLine();
            }

            //System.out.print("Nhap ho ten: ");
            String hoten = ""; //sc.nextLine();

            //System.out.print("Nhap so dien thoai: ");
            int sdt = 0; //sc.nextInt();

           // sc.nextLine();
           // System.out.print("Nhap email: ");
            String email = ""; //sc.nextLine();

            cStmt.setString(1, tendnhap);
            cStmt.setString(2, mkhau);
            cStmt.setString(3, xnmk);
            cStmt.setString(4, hoten);
            cStmt.setInt(5, sdt);
            cStmt.setString(6, email);

            rs = cStmt.executeQuery();

            System.out.print("Dang ky tai khoan thanh cong!!!");
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static boolean dangNhap() {
        try {
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call login(?,?)}");
            Scanner sc = new Scanner(System.in);
            
            System.out.print("\nTen dang nhap: ");
            String tendnhap = sc.nextLine();
            
            System.out.print("Mat khau: ");
            String mkhau = sc.nextLine();
            
            rs = stmt.executeQuery("select * from tai_khoan where ten_dnhap = '"+ tendnhap + "'"); //and mat_khau = '" + mkhau +"'");
            
            if (!rs.next()){
                System.out.println("Tai khoan khong ton tai");
                dangNhap();
            }
            else if (!mkhau.equals(rs.getString(3)))
            {
                System.out.println("Sai mat khau");
                dangNhap();
            }
            else {
                System.out.print("Dang nhap thanh cong!!!");
                 mainMenu();
                return true;
            }
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
        return false;
    }
    
    public static void search(){
        try{
            cStmt = conn.prepareCall("{call tim_khach(?)}");
            
            Scanner sc = new Scanner(System.in);
            System.out.print("Nhap ten: ");
            String ten = sc.nextLine();
            
            cStmt.setString(1, ten);
            
            rs = cStmt.executeQuery();

            DBTablePrinter.printResultSet(rs);              
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
       
    public static void dSTaiKhoan(){
        // DANH SACH TAI KHOAN
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM tai_khoan");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
      
    public static void dSNhaTro(){
    // DANH SACH NHA TRO
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM nha_tro");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
     }
     
    public static void dSLoaiPhong(){
        // DANH SACH LOAI PHONG
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM loai_phong");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void dSPhong(){
    // DANH SACH PHONG
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM phong");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }    
    
    public static void dSKhachTro(){
    // DANH SACH KHACH TRO
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM khach_tro");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void dSHDong() {
        // DANH SACH HOP DONG
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM hdong_thue");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }   
    
    public static void dSDV(){
        // DANH SACH DICH VU
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM dich_vu");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void dSPhieuThu() {  
        //DANH SACH PHIEU THU
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM phieu_thu");
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    } 
    
    public static void nhapPT(){
        try{
        cStmt = conn.prepareCall("{call add_phieuthu(?,?)}");
        Scanner sc = new Scanner(System.in);

        System.out.print("Ma phong: ");
        String maphong = sc.nextLine();
        
        System.out.print("Ngay nhap: ");
        String ngaynhap = sc.nextLine();
        
        cStmt.setString(1, maphong);
        cStmt.setString(2, ngaynhap);
        
        rs = cStmt.executeQuery();
        
        
        stmt = conn.createStatement();
        ResultSet rs2 = null;
        rs2 = stmt.executeQuery("SELECT * FROM phieu_thu");
        
        System.out.print("-------------------------");
        System.out.print("\nDa nhap phieu thu\n");
        
        DBTablePrinter.printResultSet(rs2);
        
        upDienNuoc(maphong);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }
    
    public static void setDaDong(){
        try{
        ResultSet rs2, rs3 = null;
        stmt = conn.createStatement();
        cStmt = conn.prepareCall("{call da_dong(?)}");
        Scanner sc = new Scanner(System.in);

        System.out.print("Ma phieu thu: ");
        int mpt = sc.nextInt();
       
        cStmt.setInt(1, mpt);
        
        rs = cStmt.executeQuery();
            //rs2 = stmt.executeQuery("select * from tai_khoan where ten_dnhap = '"+ tendnhap + "'");
        stmt = conn.createStatement();
        rs2 = stmt.executeQuery("SELECT * FROM phieu_thu where ma_pthu = " + mpt);
        DBTablePrinter.printResultSet(rs2);
        
        rs3 = stmt.executeQuery("SELECT * FROM phieu_thu where ma_pthu = " + mpt);
        rs3.next();
        String maphong = rs3.getString(2);
        System.out.print("-------------------------");
        System.out.print("Phong "+ maphong +" da dong tien!\n");

        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
    }

   public static void upDienNuoc(String maphong){
       try{
            ResultSet rs2 = null;
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call up_diennuoc(?,?,?)}");
            Scanner sc = new Scanner(System.in);
            
           // System.out.println("Cap nhat dien nuoc phong " + maphong);
            //System.out.print("Ma phong: ");
            //maphong = sc.nextLine();
            cStmt.setString(1, maphong);
            
            System.out.print("Chi so dien moi: ");
            int chisodien = sc.nextInt();
            cStmt.setInt(2, chisodien);
            
            System.out.print("Chi so dien moi: ");
            int chisonuoc = sc.nextInt();
            cStmt.setInt(3, chisonuoc);
            rs = cStmt.executeQuery();
            stmt = conn.createStatement();
            rs2 = stmt.executeQuery("SELECT * FROM phong");

            System.out.print("-------------------------");
            System.out.println("\nDa cap nhat dien nuoc phong " + maphong);

            DBTablePrinter.printResultSet(rs2);
            }
            catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
            }
    }
   
   public static void upDienNuoc(){
       try{
            ResultSet rs2 = null;
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call up_diennuoc(?,?,?)}");
            
            Scanner sc = new Scanner(System.in);
            System.out.print("\nMa phong: ");
            String maphong = sc.nextLine();
            
            System.out.println("\nCap nhat dien nuoc phong " + maphong);
            
            cStmt.setString(1, maphong);
            
            System.out.print("Chi so dien moi: ");
            int chisodien = sc.nextInt();
            cStmt.setInt(2, chisodien);
            
            System.out.print("Chi so dien moi: ");
            int chisonuoc = sc.nextInt();
            cStmt.setInt(3, chisonuoc);
            rs = cStmt.executeQuery();
            stmt = conn.createStatement();
            rs2 = stmt.executeQuery("SELECT * FROM phong");

            System.out.print("-------------------------");
            System.out.println("\nDa cap nhat dien nuoc phong " + maphong);

            DBTablePrinter.printResultSet(rs2);
            }
            catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
            }
    }
   
   public static void tongDoanhThu(){
        try{
            ResultSet rs2 = null;
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery("select tong_doanh_thu()");
            rs.next();
            int doanhthu = rs.getInt(1);
            System.out.print("-------------------------");
            System.out.println("\nTong doanh thu: " + doanhthu + " VND");
            }
            catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
            }
   }
   
   public static void doanhThuThang(){
        try{
            ResultSet rs2 = null;
            stmt = conn.createStatement();
            Scanner sc = new Scanner(System.in);
            
            System.out.println("Doanh thu theo thang: ");
            
            System.out.print("Nhap thang: ");
            String thang = sc.nextLine();
            
            System.out.print("Nhap nam: ");
            String nam = sc.nextLine();
            
            rs = stmt.executeQuery("select doanh_thu_thang('" + nam + "-" + thang + "')");
            rs.next();
            int doanhthu = rs.getInt(1);
            System.out.print("-------------------------");
            System.out.println("\nDoanh thu thang " + thang + "-" + nam + ": " + doanhthu + " VND");
            }
            catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
            }
   }
   
   public static void upGiaDV(){
        try{
            ResultSet rs2 = null;
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call up_dichvu(?,?)}");
            Scanner sc = new Scanner(System.in);
            
            System.out.println("Cap nhat don gia dien nuoc ");
            
            System.out.print("Don gia dien moi: ");
            int dgdien = sc.nextInt();
            cStmt.setInt(1, dgdien);
            
            System.out.print("Don gia nuoc moi: ");
            int dgnuoc = sc.nextInt();
            cStmt.setInt(2, dgnuoc);
            rs = cStmt.executeQuery();
            stmt = conn.createStatement();
            rs2 = stmt.executeQuery("SELECT * FROM dich_vu");

            System.out.print("-------------------------");
            System.out.println("\nDa cap nhat gia dien nuoc  ");

            DBTablePrinter.printResultSet(rs2);
            }
            catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
            }
   }
   
   public static void addHDong(){
       try{
        cStmt = conn.prepareCall("{call add_hdong(?,?,?,?)}"); 
        
        Scanner sc = new Scanner(System.in);
        System.out.print("Ma khach: ");
        String makhach = sc.nextLine();
        System.out.print("Ma phong: ");
        String maphong = sc.nextLine();
        System.out.print("Ngay lap: ");
        String ngaylap = sc.nextLine();
        System.out.print("Ngay tra phong: ");
        String ngaytra = sc.nextLine();
        
        cStmt.setString(1, makhach);
        cStmt.setString(2, maphong);
        cStmt.setString(3, ngaylap);
        cStmt.setString(4, ngaytra);

        rs = cStmt.executeQuery();

        ResultSet rs2 = null; 
        stmt = conn.createStatement();
        rs2 = stmt.executeQuery("SELECT * FROM hdong_thue");
        
        System.out.print("-------------------------");
        System.out.print("\nDa them hop dong\n");
        
        DBTablePrinter.printResultSet(rs2);
       
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }

   public static void upHDong(){
       try{
        ResultSet rs2, rs3 = null;
        stmt = conn.createStatement();
        cStmt = conn.prepareCall("{call up_hdong(?,?)}");
        Scanner sc = new Scanner(System.in);

        System.out.print("Ma phong: ");
        String maphong = sc.nextLine();
        
        System.out.print("Ngay tra phong moi: ");
        String ngaytra = sc.nextLine();
        
        cStmt.setString(1, maphong);
        cStmt.setString(2, ngaytra);
        
        rs = cStmt.executeQuery();
        
        stmt = conn.createStatement();
        rs2 = stmt.executeQuery("SELECT * FROM hdong_thue");
        rs2.next();
        
        String mahd = rs2.getString(1);
        
        System.out.print("-------------------------");
        System.out.print("\nDa gia han hop dong\n");
        
        rs3 = stmt.executeQuery("SELECT * FROM hdong_thue where ma_hdong = " + mahd);
        DBTablePrinter.printResultSet(rs3);
       
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }
   
   public static void emptyRoom(){
       try{
       // ResultSet rs = null;
        stmt = conn.createStatement();
        Scanner sc = new Scanner(System.in);
        
        rs = stmt.executeQuery("select * from phong where duoc_thue = 'N'");
        System.out.print("-------------------------");
        System.out.print("\nCac phong trong:\n");

        DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }
   
   public static void tongDien(){
        try{
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery("select total_dien()");
            rs.next();
            int dientthu = rs.getInt(1);
            System.out.print("-------------------------");
            System.out.println("\nTong dien tieu thu: " + dientthu + " kWh");
            }
        
        catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
        }
   }
  
   public static void tongNuoc(){
       try{
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery("select total_nuoc()");
            rs.next();
            int nuoctthu = rs.getInt(1);
            System.out.print("-------------------------");
            System.out.println("\nTong dien tieu thu: " + nuoctthu + " m3");
        }
        
       catch (SQLException ex){ //xử lý ngoại lệ
                System.out.println("SQLException: " + ex.getMessage());
       }
   }
   
   public static void khachNo(){
       try{
        ResultSet rs2 = null;
        stmt = conn.createStatement();
        cStmt = conn.prepareCall("{call khach_no()}");
        
        rs = cStmt.executeQuery();
        System.out.print("-------------------------");
        System.out.print("\nCac khach chua thanh toan tien phong:\n");

        DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }
   
   public static void xoaKhach(){
        try {
            ResultSet rs2;
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call delete_khach(?)}");
            Scanner sc = new Scanner(System.in);
            
            System.out.print("Nhap ma khach can xoa: ");
            String mkhach = sc.nextLine();
            
            cStmt.setString(1, mkhach);
            rs = cStmt.executeQuery();
            rs2 = stmt.executeQuery("select * from khach_tro");
            
            System.out.print("Xoa khach thanh cong!!!\nDanh sach khach duoc cap nhat: \n");
            
            DBTablePrinter.printResultSet(rs2);
         
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }
   
   public static void inputKhach(){
        ResultSet rs2 = null;
        try {
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call ins_khach(?,?,?,?,?,?)}");
            Scanner sc = new Scanner(System.in);
            
            System.out.println("Nhap khach hang moi: ");
            
            System.out.print("Ma khach: ");
            String makhach = sc.nextLine();
           
            rs2 = stmt.executeQuery("select * from khach_tro where ma_khach = '"+ makhach + "'");

            while (rs2.next() && makhach.equals(rs2.getString(1))){
                System.out.println("Ma khach hang da ton tai");
                System.out.print("Nhap lai ma khach hang: ");
                makhach = sc.nextLine();
                rs2 = stmt.executeQuery("select * from khach_tro where ma_khach = '"+ makhach + "'");
            } 

            System.out.print("Ho va ten: ");
            String hoten = sc.nextLine();

            System.out.print("Ngay sinh: ");
            String nsinh = sc.nextLine();

            System.out.print("CMND: ");
            String cmnd = sc.nextLine();

            System.out.print("Gioi tinh: ");
            String gioitinh = sc.nextLine();

            System.out.print("So dien thoai: ");
            int sdt = sc.nextInt();

            cStmt.setString(1, makhach);
            cStmt.setString(2, hoten);
            cStmt.setString(3, nsinh);
            cStmt.setString(4, cmnd);
            cStmt.setString(5, gioitinh);
            cStmt.setInt(6, sdt);

            rs = cStmt.executeQuery();

            System.out.print("Them khach hang thanh cong!!!");
            
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }
   
   public static void inputPhong(){
       ResultSet rs2 = null;
        try {
            stmt = conn.createStatement();
            cStmt = conn.prepareCall("{call ins_phong(?,?,?,?)}");
            Scanner sc = new Scanner(System.in);
            
            System.out.println("Nhap phong moi: ");
            
            System.out.print("Ma phong: ");
            String mphong = sc.nextLine();
            
           
            rs2 = stmt.executeQuery("select * from phong where ma_phong = '"+ mphong + "'");

            while (rs2.next() && mphong.equals(rs2.getString(1))){
                System.out.println("Ma phong da ton tai");
                System.out.print("Nhap lai ma phong: ");
                mphong = sc.nextLine();
                rs2 = stmt.executeQuery("select * from phong where ma_phong = '"+ mphong + "'");
            } 

            System.out.print("Gia phong: ");
            int giaphong = sc.nextInt();
            
            sc.nextLine();
            System.out.print("Ma loai phong: ");
            String mloai = sc.nextLine();

            System.out.print("Ma tro: ");
            String mtro = sc.nextLine();


            cStmt.setString(1, mphong);
            cStmt.setInt(2, giaphong);
            cStmt.setString(3, mloai);
            cStmt.setString(4, mtro);

            rs = cStmt.executeQuery();

            System.out.print("Them phong thanh cong!!!");
            
            DBTablePrinter.printResultSet(rs);
        }
        catch (SQLException ex){ //xử lý ngoại lệ
            System.out.println("SQLException: " + ex.getMessage());
        }
   }
}