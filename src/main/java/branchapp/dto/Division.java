package branchapp.dto;

import javax.persistence.*;

@NamedNativeQueries({
        @NamedNativeQuery(name = "Divisions", query = "SELECT bankname as x, summ as value, CASE glb WHEN '392' THEN '#ffff00' ELSE '#dc143c' END as fill FROM divisions where dates = ? order by summ desc limit 30", resultSetMapping = "Divisions"),
        @NamedNativeQuery(name = "DivisionsAll", query = "SELECT bankname as x, summ as value, CASE glb WHEN '392' THEN '#ffff00' ELSE '#dc143c' END as fill, dates as dates FROM divisions order by summ desc", resultSetMapping = "DivisionsAll"),
})

@SqlResultSetMapping(name = "Divisions", classes = @ConstructorResult(targetClass = Divs.class,
        columns = {
                @ColumnResult(name = "x"),
                @ColumnResult(name = "value", type = int.class),
                @ColumnResult(name = "fill")
                //@ColumnResult(name = "dates")
        }
)
)

@SqlResultSetMapping(name = "DivisionsAll", classes = @ConstructorResult(targetClass = DivsAll.class,
        columns = {
                @ColumnResult(name = "x"),
                @ColumnResult(name = "value", type = int.class),
                @ColumnResult(name = "fill"),
                @ColumnResult(name = "dates")
        }
)
)

@Entity
@Table(name = "division")
public class Division {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

private String bankname;
private int summ;
private String dates;

    public Division() {
    }

    public Division(int id, String bankname, int summ, String dates) {
        this.id = id;
        this.bankname = bankname;
        this.summ = summ;
        this.dates = dates;
    }

    public Division(String bankname, int summ, String dates) {
        this.bankname = bankname;
        this.summ = summ;
        this.dates = dates;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    public int getSumm() {
        return summ;
    }

    public void setSumm(int summ) {
        this.summ = summ;
    }

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }

    @Override
    public String toString() {
        return "Division{" +
                "id=" + id +
                ", bankname='" + bankname + '\'' +
                ", summ=" + summ +
                ", dates='" + dates + '\'' +
                '}';
    }
}
