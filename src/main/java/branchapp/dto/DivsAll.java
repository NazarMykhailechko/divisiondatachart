package branchapp.dto;

public class DivsAll {
    private String x;
    private int value;
    private String fill;
    private String dates;

    public DivsAll() {
    }

    public DivsAll(String x, int value, String fill, String dates) {
        this.x = x;
        this.value = value;
        this.fill = fill;
        this.dates = dates;
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

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }

    @Override
    public String toString() {
        return "{" +
                "\"x\":\"" + x + '\"' +
                ", \"value\":" + value +
                ", \"fill\":\"" + fill + '\"' +
                ", \"dates\":\"" + dates + '\"' +
                '}';
    }
}
