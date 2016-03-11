package za.ac.tut.banking;

public class Banking
{

    private String accHolder;
    private String bank;
    private long accountNumber;

    public Banking() 
    {
    }

    public Banking(String accHolder, String bank, long accountNumber) 
    {
        this.accHolder = accHolder;
        this.bank = bank;
        this.accountNumber = accountNumber;
    }

    public void setAccHolder(String accHolder) {
        this.accHolder = accHolder;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public void setAccountNumber(long accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAccHolder() {
        return accHolder;
    }

    public String getBank() {
        return bank;
    }

    public long getAccountNumber() 
    {
        return accountNumber;
    }
}
