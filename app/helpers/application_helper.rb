module ApplicationHelper
  def generate_qr_code(url, size: 200)
    qrcode = RQRCode::QRCode.new(url)
    png = qrcode.as_png(size: size)
    Base64.encode64(png.to_s)
  end
end
