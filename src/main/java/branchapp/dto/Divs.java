package branchapp.dto;

public class Divs {

    private String x;
    private int value;
    private String fill;
    //private String dates;

    public Divs() {
    }

    public Divs(String x, int value, String fill) {
        this.x = x;
        this.value = value;
        this.fill = fill;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getFill() {
        return fill;
    }

    public void setFill(String fill) {
        this.fill = fill;
    }

    @Override
    public String toString() {
        return "Divs{" +
                "x='" + x + '\'' +
                ", value=" + value +
                ", fill='" + fill + '\'' +
                '}';
    }
}
