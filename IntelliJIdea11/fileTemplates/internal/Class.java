#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME};#end
#parse("File Header.java")
public class ${NAME} {
  public static void main(String[] args) {
    new ${NAME}().solve();
  }

  public void solve() {
    Scanner in = new Scanner(System.in);
    
  }
}